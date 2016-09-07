class Resource < ActiveRecord::Base
  include Assignable
  include Commentable
  include Searchable
  include LearningRegistryPublishable
  include Linkable

  KINDS_WITH_URLS = %w(app file ibook undefined video video_channel webpage)
  KINDS_WITHOUT_URLS = %w(course learning_product artifact unit activity)
  KINDS = KINDS_WITH_URLS + KINDS_WITHOUT_URLS

  belongs_to :user

  has_many :badge_requirements
  has_many :badges, through: :badge_requirements

  has_many :collection_resources
  has_many :collections, -> { uniq }, through: :collection_resources
  has_many :content_blocks, -> { order(:position) }, dependent: :destroy

  has_many :assignment_details

  before_save :reject_blank_tags, :sort_tags
  after_create :track

  INDEX_COUNTER = 5
  settings ::Searchable::SETTINGS do
    mappings do

      # disabled
      indexes :imported_data, type: "object", enabled: false
      indexes :reviews, type: "object", enabled: false

      # default
      indexes :defunct, type: 'boolean'
      indexes :score, type: 'float'
      indexes :community_score, type: 'float'
      indexes :expert, type: 'boolean'
      indexes :oer, type: 'boolean'

      # not_analyzed
      indexes :author, type: 'string', index: 'not_analyzed'
      indexes :content_type, type: 'string', index: 'not_analyzed'
      indexes :expanded_grade_levels, type: 'string', index: 'not_analyzed'
      indexes :grade_level_groups, type: 'string', index: 'not_analyzed'
      indexes :grade_levels, type: 'string', index: 'not_analyzed'
      indexes :groups, type: 'string', index: 'not_analyzed'
      indexes :id, type: 'string', index: 'not_analyzed'
      indexes :image_url, type: 'string', index: 'not_analyzed'
      indexes :kind, type: 'string', index: 'not_analyzed'
      indexes :os, type: 'string', index: 'not_analyzed'
      indexes :price, type: 'string', index: 'not_analyzed'
      indexes :type, type: 'string', index: 'not_analyzed'
      indexes :url, type: 'string', index: 'not_analyzed'
      indexes :visibility, type: 'string', index: 'not_analyzed'

      # lowercase_keyword
      indexes :common_core_tags, type: 'string', analyzer: 'lowercase_keyword'
      indexes :name_exact, type: 'string', analyzer: 'lowercase_keyword'
      indexes :owner_exact, type: 'string', analyzer: 'lowercase_keyword'

    end
  end

  validates_presence_of :kind
  validates_inclusion_of :kind, in: KINDS

  #validates_absence_of :url, if: :content?
  validates_presence_of :url, unless: :content?
  validates_format_of :url, with: %r{\Ahttps?://}, unless: :content?

  def self.vif(k2_id)
<<<<<<< HEAD
    find_by(greenprintmedia_k2_item_id: k2_id)
=======
    find_by(viflearn_k2_item_id: k2_id)
>>>>>>> parent of 0bd3464... customize to greenprintmedia
  end

  # Defaults to "resources" but our paths are specific to the "content_type"
  def link_resource_path
    case kind
    when "activity", "unit"
      "learning_products"
    else
      self.content_type.pluralize
    end
  end

  def assignment_link
    [Secrets.site_url, "assignments", name.parameterize, id].join("/")
  end

  def self.kind(kind)
    where(kind: kind)
  end

  def self.reviewed_by_user(user)
    reviewed_by_user_id(user.id)
  end

  def self.flagged(tag)
    where("flags @> '{\"#{tag}\": true}'")
  end

  def self.reviewed_by_user_id(user_id)
    where([
      "reviews @> ?",
      %([{"user_id": "#{user_id}"}])
    ])
  end

  def self.with_common_core_tags_approved
    where([
      "flags @> ?",
      %({"common_core_tags_approved": true})
    ])
  end

  def self.without_common_core_tags_approved
    where.not([
      "flags @> ?",
      %({"common_core_tags_approved": true})
    ])
  end

  def self.with_tags_approved
    where([
      "flags @> ?",
      %({"tags_approved": true})
    ])
  end

  def self.without_tags_approved
    where.not([
      "flags @> ?",
      %({"tags_approved": true})
    ])
  end

  def self.unset_tags_approved
    where.not([
      "flags @> ?",
      %({"tags_approved": true})
    ]).where.not([
      "flags @> ?",
      %({"tags_approved": false})
    ])
  end

  def self.with_tag_like(string)
    like_string = "%#{string}%".downcase
    where([
      %[ lower(tags::text) LIKE ? ],
      like_string
    ])
  end

  def self.with_duplicate_reviews
    where(%[
      resources.id IN (
        select resource_id
        from reviews
        group by resource_id, user_id
        having count(*) > 1
      )
    ])
  end

  def self.defunct
    where.not(defunct_at: nil)
  end

  def self.new_with_content(params, user)
    content = params.delete(:content)

    params[:user_id] = user.id
    params[:kind] = "learning_product"
    resource = Resource.new(params)

    content.each_with_index do |c, idx|
      c["position"] = idx
      c["resource"] = resource

      if file = c.delete(:file)
        c.uploaded_file = UploadedFile.create(file: file, user_id: user.id)
      end
    end

    resource.content_blocks.build(content)
    resource
  end

  def kind=(value)
    if visibility == "undefined" || visibility.nil?
      case value
      when nil, "undefined"
        self.visibility = "undefined"
      when "app", "video", "ibook"
        self.visibility = "public"
      when "learning_product", "unit", "activity"
        self.visibility = "private"
      when "course"
        self.visibility = "protected"
      when "artifact", "file", "webpage", "video_channel"
        self.visibility = "private"
      else
        raise "Unhandled default visibility value for kind: #{value}"
      end
    end
    super
  end

  def content?
    KINDS_WITHOUT_URLS.include?(kind)
  end

  def public?
    visibility == "public"
  end

  def hidden?
    visibility == "hidden"
  end

  def protected?
    visibility == "protected"
  end

  def auto_common_core_tags
    common_core_tags
      .map { |t| t.sub(/\.[^.]+\z/, '') }
      .uniq
      .flat_map { |t|
        CommonCore.all.select { |cc| cc.name.starts_with?(t) }
          .map(&:name)
      }
      .concat(common_core_tags)
      .uniq
      .sort
  end

  def as_indexed_json(options = {})
    ResourceSerializer.new(self).as_json
  end

  def image_url
    if super.nil?
      nil
    else
      super.sub(
        %r{\Ahttp://v\.aimg\.us/},
        Appo::Constants::CDN_URL
      ).sub(
        %r{\Ahttp://i\.vimeocdn\.com/},
        'https://i.vimeocdn.com/'
      )
    end
  end

  def score
    scores = completed_reviews
              .select{ |r| r.fetch('expert', true) == true }
              .map{ |r| r.fetch('total_score') }
    if scores.empty?
      0.01
    else
      scores.sum.to_f / scores.size
    end
  end

  def community_score
    scores = completed_reviews
              .select{ |r| r.fetch('expert', true) == false }
              .map{ |r| r.fetch('total_score') }
    if scores.empty?
      0.01
    else
      scores.sum.to_f / scores.size
    end
  end

  def completed_reviews
    reviews.select { |r|
      r.fetch('content_score') > 0 &&
      r.fetch('feature_score') > 0 &&
      r.fetch('engagement_score') > 0
    }
  end

  def review_count
    reviews.size
  end

  def free?
    price == 'Free' ? true : false
  end

  def content_type
    case kind
    when "app"
      case os
      when 'ios' then 'ios-app'
      when 'android' then 'android-app'
      else raise "Unhandled app content type"
      end
    when "learning_product"
      vif? ? "lesson-plan" : kind
    else
      kind
    end
  end

  def url
    if content?
      super || link
    else
      super
    end
  end

  def os
    if kind == "app"
      Appo::ResourceKind.os(url)
    else
      nil
    end
  end

  def app_store_id
    Appo::ResourceKind.app_store_id(url)
  end

  def correct_grade_levels
    if flags.fetch('grade_levels_approved', false)
      grade_levels
    else
      combined_grade_levels
    end
  end

  def combined_grade_levels
    (grade_levels | auto_grade_levels).sort_by{ |i|
      Appo::ResourceTags::GRADES.index(i)
    }
  end

  def expanded_grade_levels
    combined_grade_levels.map{ |gl|
      Appo::ResourceTags::GRADE_MAPPING.fetch(gl)
    }
  end

  def auto_grade_levels
    auto_mapped_grade_levels | auto_gapped_grade_levels
  end

  def auto_gapped_grade_levels
    return [] if grade_levels.empty?

    grade_indices = grade_levels.map{ |grade|
      Appo::ResourceTags::GRADES.index(grade)
    }

    grade_range = grade_indices.min..grade_indices.max
    Appo::ResourceTags::GRADES.slice(grade_range)
  end

  def auto_mapped_grade_levels
    ([
      'Early Childhood',
      'Elementary School',
      'Middle School',
      'High School'
    ] & tags).flat_map{ |tag|
      {
        'Early Childhood' => %w(Pre-K K),
        'Elementary School' => %w(K 1st 2nd 3rd 4th 5th 6th),
        'Middle School' => %w(5th 6th 7th 8th),
        'High School' => %w(9th 10th 11th 12th)
      }.fetch(tag)
    }
  end

  def tags= ts
    super
    tags.reject!(&:blank?)
    tags
  end

  def common_core_tags= ts
    super
    common_core_tags.reject!(&:blank?)
    common_core_tags.sort!
    common_core_tags
  end

  def self.trending(time_period: 1.hour, result_count: 10)
    Resource.find_by_sql <<-SQL
      WITH trending as (
        SELECT resource_id, count(1) as count
        FROM chat_resources
        WHERE chat_resources.created_at > now() - interval '#{time_period} seconds'
        GROUP BY 1
        ORDER BY 2 DESC
        LIMIT #{result_count} )

      SELECT resources.*, trending.count
      FROM trending JOIN resources on trending.resource_id = resources.id
    SQL
  end

  def comment_recipients
    [user]
  end

  def is_assigned_to?(user)
    assignments.where(user: user).exists? ||
      user.assignments.where(assignable: collections).exists?
  end

  def assignment_for(user)
    user.assignments.where(assignable: collections).first
  end

  def vif?
    # TODO: clean this up
    # These user_ids seemed to create too much cruft ... need to investigate
    #user_id == "ce111674-5fac-4718-ac28-787addd42261" ||
    #  user_id == "f1b66ab2-cf0d-446c-a6f0-86540ef0ae8e" ||
      imported_data["created_by"] == 943 ||
      Array(imported_data["extra_fields"]).include?(
        {"id" => 26, "name" => "Authored By", "value" => "VIF"}
      )
  end

  def expert?
    reviews.any? { |review| review.fetch("expert") }
  end

  def community?
    !vif? && !expert?
  end

  def author
    case
    when vif?
      "vif"
    when expert?
      "expert"
    else
      "community"
    end
  end

  private

  def reject_blank_tags
    self.tags = tags
    self.common_core_tags = common_core_tags
  end

  def sort_tags
    if tags_changed?
      self.tags = tags.sort_by{|tag| tag.downcase }
    end
  end

  def track
    Tracking.track :resource_create,
      user: user,
      anonymous_id: (user ? nil : Appo::Constants::NIL_UUID),
      data: { resource_id: id, name: name, kind: kind }
  end
end
