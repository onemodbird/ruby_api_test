class ResourceSerializer < BaseSerializer

  attributes :id, :kind, :type, :content_type, :name, :name_exact, :owner, :owner_exact
  attributes :user_id, :expert, :editable
  attributes :url, :image_url, :screenshot_urls, :price, :free, :description, :os
  attributes :defunct, :visibility
  attributes :score, :community_score
  attributes :grade_level_groups, :grade_levels, :expanded_grade_levels
  attributes :tags, :subject_tags, :topic_tags, :common_core_tags
  attributes :reviews, :permissions
  attributes :oer, :groups, :author
  attributes :content_blocks, :channel, :discussion_prompt
  has_many :badges, through: :badge_requirements

  def type
    object.content_type
  end

  def name_exact
    object.name
  end

  def owner_exact
    object.owner
  end

  def defunct
    !!object.defunct_at
  end

  def free
    object.free?
  end

  def expert
    object.expert?
  end

  def editable
    can? :update, object
  end

  def grade_level_groups
    [
      ((object.grade_levels & %w(Pre-K K)).any? ? 'Early Childhood' : nil ),
      ((object.grade_levels & %w(K 1st 2nd 3rd 4th 5th 6th)).any? ? 'Elementary School' : nil ),
      ((object.grade_levels & %w(5th 6th 7th 8th)).any? ? 'Middle School' : nil ),
      ((object.grade_levels & %w(9th 10th 11th 12th)).any? ? 'High School' : nil )
    ].compact
  end

  def grade_levels
    (object.correct_grade_levels | learning_registry_grade_levels)
    .sort_by { |i| Appo::ResourceTags::GRADES.index(i) }
  end

  def tags
    (object.tags | learning_registry_tags).compact.sort_by { |tag| tag.downcase }
  end

  def learning_registry_tags
    @learning_registry_tags ||=
      object.learning_registry.map { |k, v| v["keys"] }.flatten
  end

  def learning_registry_grade_levels
    grade_map = {

      "pre-k&mdash;grade" => %w(Pre-K),
      "pre-k?grade" => %w(Pre-K),
      "prek-grade" => %w(Pre-K),
      "preschool-grade" => %w(Pre-K),
      "grade pre-k" => %w(Pre-K),

      "(kindergarten-grade" => %w(K),
      "grade k" => %w(K),

      "1 - first grade" => %w(1st),
      "1st grade" => %w(1st),
      "grade 1" => %w(1st),
      "grade1" => %w(1st),
      "first grade" => %w(1st),
      "first-grade" => %w(1st),

      "2 - second grade" => %w(2nd),
      "2nd grade" => %w(2nd),
      "second grade" => %w(2nd),
      "second-grade" => %w(2nd),
      "grade 2" => %w(2nd),

      "3 - third grade" => %w(3rd),
      "3rd grade" => %w(3rd),
      "third grade" => %w(3rd),
      "third-grade" => %w(3rd),
      "grade 3" => %w(3rd),

      "4 - fourth grade" => %w(4th),
      "4th grade" => %w(4th),
      "4th grade ela" => %w(4th),
      "fourth grade" => %w(4th),
      "fourth-grade" => %w(4th),
      "fourth-graders" => %w(4th),
      "fourth-graders)" => %w(4th),
      "grade 4" => %w(4th),

      "5 - fifth grade" => %w(5th),
      "5th-grade" => %w(5th),
      "fifth grade" => %w(5th),
      "fifth-grade" => %w(5th),
      "fifth-graders" => %w(5th),
      "grade 5" => %w(5th),

      "6 - sixth grade" => %w(6th),
      "6-12 grade" => %w(6th 7th 8th 9th 10th 11th 12th),
      "6th grade language arts" => %w(6th),
      "6th-grade" => %w(6th),
      "sixth grade" => %w(6th),
      "sixth grades" => %w(6th),
      "sixth-grade" => %w(6th),
      "grade 6" => %w(6th),

      "7 - seventh grade" => %w(7th),
      "seventh-grade" => %w(7th),
      "grade 7" => %w(7th),

      "8 - eighth grade" => %w(8th),
      "8 grade" => %w(8th),
      "8th-graders" => %w(8th),
      "eighth-grade" => %w(8th),
      "grade 8" => %w(8th),

      "9 - ninth grade" => %w(9th),
      "ninth-grade" => %w(9th),
      "grade 9" => %w(9th),

      "10 - tenth grade" => %w(10th),
      "10th grade" => %w(10th),
      "grade 10" => %w(10th),

      "11 - eleventh grade" => %w(11th),
      "eleventh-grade" => %w(11th),
      "grade 11" => %w(11th),

      "12 - twelfth grade" => %w(12th),
      "12th-graders" => %w(12th),
      "twelfth-grade" => %w(12th),
      "grade 12" => %w(12th),

      "educational resources -- grade level: elementary" => %w(K 1st 2nd 3rd 4th 5th 6th),
      "educational resources -- grade level: elementary -- classic elementary resources (developed before the year 2000)" => %w(K 1st 2nd 3rd 4th 5th 6th),
      "educational resources -- grade level: elementary -- current elementary resources" => %w(K 1st 2nd 3rd 4th 5th 6th),

      "educational resources -- grade level: middle school" => %w(5th 6th 7th 8th),
      "educational resources -- grade level: middle school -- classic middle level resources (developed before the year 2000)" => %w(5th 6th 7th 8th),
      "educational resources -- grade level: middle school -- current middle level resources" => %w(5th 6th 7th 8th),

      "educational resources -- grade level: secondary" => %w(9th 10th 11th 12th),
      "educational resources -- grade level: secondary -- ap biology resource" => %w(9th 10th 11th 12th),
      "educational resources -- grade level: secondary -- classic secondary resources (developed before the year 2000)" => %w(9th 10th 11th 12th),
      "educational resources -- grade level: secondary -- current secondary resources" => %w(9th 10th 11th 12th),

      # "educational resources -- grade level: undergraduate" => %w(),
      # "educational resources -- grade level: undergraduate -- classic undergraduate level resources (developed before the year 2000)" => %w(),
      # "educational resources -- grade level: undergraduate -- current undergraduate level resources" => %w(),

      "9-10 grade" => %w(9th 10th),
      "grade 6-8" => %w(6th 7th 8th),
      "elementary-grade" => %w(K 1st 2nd 3rd 4th 5th 6th),
      "grade-school" => %w(K 1st 2nd 3rd 4th 5th 6th),
      "middle grades" => %w(5th 6th 7th 8th),
      "middle-grade" => %w(5th 6th 7th 8th),
      "middle-grades" => %w(5th 6th 7th 8th),
      "primary grades" => %w(K 1st 2nd 3rd 4th 5th 6th),
      "primary-grade" => %w(K 1st 2nd 3rd 4th 5th 6th),
      "upper grades" => %w(5th 6th 7th 8th),
    }

    learning_registry_tags
      .select { |tag| tag =~ /grade/i }
      .map { |tag| grade_map[tag.downcase] }
      .flatten
      .compact
  end

  def groups
    grps = []
    grps << "oer" if object.oer?
    grps << "vif" if object.vif?
    grps
  end

  def subject_tags
    []
  end

  def topic_tags
    []
  end

  def reviews
    @reviews ||= object.reviews.map do |r|
      # FIXME: this if !user business is a work-around so indexing doesn't
      # fail, but we really need to audit reviews and clean them up...
      user = User.find_by(id: r.fetch('user_id'))
      if !user
        nil
      else
        {
          'id' => r.fetch('id'),
          'comment' => r.fetch('comment'),
          'content_score' => r.fetch('content_score'),
          'feature_score' => r.fetch('feature_score'),
          'engagement_score' => r.fetch('engagement_score'),
          'total_score' => r.fetch('total_score'),
          'total_score_as_percentage' => r.fetch('percent_score'),
          'total_score_out_of_ten' => (r.fetch('percent_score').to_f / 10).round(1),
          'reviewer' => {
            'id' => user.id,
            'name' => user.name,
            'profile_photo_url' => user.profile_photo_url,
            'expert' => user.expert
          }
        }
      end
    end
    .compact
  end

  def content_blocks
    ContentBlockSerializer.list(object.content_blocks)
  end

  def channel
    RealtimeService.channel_name(object, true)
  end
end
