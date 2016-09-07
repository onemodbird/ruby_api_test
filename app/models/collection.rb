class Collection < ActiveRecord::Base
  include Assignable
  include ChangeLoggable
  include Collaboratable
  include Commentable
  include Searchable
  include Subscribable
  include Linkable

  change_log_for :name, :description, :visibility, :tags

  belongs_to :user

  has_many :collection_resources, -> { order(:position) }, dependent: :destroy
  has_many :resources, through: :collection_resources
  has_many :uploaded_files,
           -> { where attached_class: 'Collection' },
           foreign_key: 'attached_id'
  has_one  :transcript

  validates :name, presence: true, length: { maximum: 100 }
  validates :description, length: { maximum: 1500 }

  scope :preview, -> { flagged("preview", true) }

  after_create { subscribe(user_id) }
  after_create :track

  before_destroy :destroy_notifications

  INDEX_COUNTER = 10
  settings ::Searchable::SETTINGS do
    mappings dynamic: false do
      indexes :id, type: 'string', index: 'not_analyzed'
      indexes :name, type: 'string'

      indexes :tags,
        type: "string",
        fields: {
          keyword: { type: "string", analyzer: "lowercase_keyword" }
        }

      indexes :system_generated, type: 'boolean'
      indexes :expert, type: 'boolean'
      indexes :hidden, type: 'boolean'
      indexes :resources_count, type: 'integer'
      indexes :timestampi, type: 'integer'
      indexes :visibility, type: 'string', index: 'not_analyzed'
      indexes :grade_levels, type: "string", index: "not_analyzed"
      indexes :groups, type: "string", index: "not_analyzed"

      indexes :description, type: "string"
      indexes :resources, type: "object", dynamic: false do
        indexes :name, type: "string"
        indexes :tags, type: "string"
        indexes :free, type: "boolean"
        indexes :kind, type: "string", index:"not_analyzed"
        indexes :author, type: "string", index:"not_analyzed"
        indexes :common_core_tags, type: "string", analyzer: "lowercase_keyword"
      end

      indexes :created_at, type: "string", index: "no"
      indexes :updated_at, type: "string", index: "no"
      indexes :counts, type: "object", enabled: false
      indexes :timestamp, type: "string", index: "no"
      indexes :user, type: "object", enabled: false
    end
  end

  def self.flagged(tag, value = true)
    where("flags @> '{\"#{tag}\": #{value == true}}'")
  end

  def self.not_flagged(tag)
    where.not("flags @> '{\"#{tag}\": true}'")
  end

  def as_indexed_json(options = {})
    CollectionSerializer.new(self).as_json
  end

  def public?
    visibility == 'public'
  end

  after_save do
    if visibility_changed?
      maintain_resource_visibility(
        resources.select{ |r| ['webpage', 'file'].include?(r.kind) })
    end
  end

  def maintain_resource_visibility(resources)
    resources = [resources].flatten
    return if resources.empty?

    case visibility
    when 'public'
      resources.each do |r|
        r.update_attributes(visibility: 'public') unless r.public?
      end

    when 'hidden'
      resources.each do |r|
        case r.visibility
        when 'hidden'
          # do nothing
        when 'private'
          r.update_attributes(visibility: 'hidden')
        when 'public'
          if r.user_id == user_id
            other_collection_ids = r.collections.pluck(:id)
            if (other_collection_ids - [id]).empty?
              r.update_attributes(visibility: 'hidden')
            end
          end
        else
          raise "Unhandled Resource#visibility value: #{r.visibility}"
        end
      end

    when 'private'
      resources.each do |r|
        case r.visibility
        when 'private'
          # do nothing
        when 'hidden', 'public'
          if r.user_id == user_id
            other_collection_ids = r.collections.pluck(:id)
            if (other_collection_ids - [id]).empty?
              r.update_attributes(visibility: 'private')
            end
          end
        else
          raise "Unhandled Resource#visibility value: #{r.visibility}"
        end
      end

    else
      raise "Unhandled Collection#visibility value: #{visibility}"
    end
  end

  def counts
    resources.inject({}) do |hash, resource|
      hash[resource.kind] ||= 0
      hash[resource.kind] += 1
      hash
    end
  end

  def resources_count
    resources.count
  end

  def self.create_with_resources!(created_by_id, params)
    params = params.symbolize_keys
    resources = params.delete(:resources)

    collection = create!(params.merge(user_id: created_by_id))

    if resources.present?
      resources.each_with_index do |resource, idx|
        collection.collection_resources.create(
          user_id: created_by_id,
          resource_id: resource[:id],
          position: idx + 1)
      end

      collection.maintain_resource_visibility Resource.find(resources.map{|resource| resource[:id]})
    end

    collection.change_log(created_by_id, "created", "Collection", collection.id)
    collection.index!

    collection
  end

  def add_resource(changed_by, resource_id)
    resource = Resource.find(resource_id)

    collection_resource = collection_resources.create(
      user: changed_by,
      resource: resource,
      position: resources_count + 1)

    if collection_resource.valid?
      Event.emit! :resource_added, collection_resource

      maintain_resource_visibility(resource)

      change_log(changed_by, "resource added", "Resource", resource_id)
      index!
    end

    collection_resource
  end

  def update_resource(changed_by, resource_id, params)
    params = params.symbolize_keys
    collection_resource = collection_resources.find_by!(resource_id: resource_id)

    Collection.transaction do
      if params[:position].present? && collection_resource.position != params[:position]
        collection_resources.where("position > ?", collection_resource.position).update_all("position = position - 1")
        collection_resources.where("position >= ?", params[:position]).update_all("position = position + 1")

        change_log(changed_by, "resources reordered")
      end

      collection_resource.update_attributes(params)

      index!
    end
  end

  def remove_resource(changed_by, resource_id)
    collection_resource = collection_resources.find_by!(resource_id: resource_id)

    Collection.transaction do
      collection_resources.where("position > ?", collection_resource.position).update_all("position = position - 1")
      collection_resource.destroy
      change_log(changed_by, "resource removed", "Resource", resource_id)
    end

    index!

    true
  end

  def timestamp
    updated_at.strftime("%B %e, %Y")
  end

  def timestampi
    updated_at.to_i
  end

  # Popular or possibly curated tags to display on index page
  def self.index_tags(quantity = 20)
    tags_to_prepend = ["all"]
    tags_to_insert = []
    manual_tags = tags_to_prepend + tags_to_insert
    manual_quantity = manual_tags.size
    auto_quantity = quantity - manual_quantity

    counts = where.not(tags: "[]").pluck(:tags).inject({}) do |hash, tags|
      tags.each do |tag|
        tag = tag.to_s.downcase
        next if tag.blank? || manual_tags.include?(tag)
        hash[tag] ||= 0
        hash[tag] += 1
      end
      hash
    end

    top_counts = counts.to_a.sort_by{ |t| -t[1] }.first(auto_quantity)
    top_tags = top_counts.map(&:first)
    tags = top_tags.sort_by(&:downcase)

    tags_to_prepend + tags
  end

  def change_log_for_tags(changed_by, previous_value, new_value)
    (previous_value - new_value).each do |removed|
      change_log(changed_by, "tag '#{removed}' removed")
    end

    (new_value - previous_value).each do |added|
      change_log(changed_by, "tag '#{added}' added")
    end
  end

  def to_feature
    [name, id].join(' - ')
  end

  def expert
    user.try(:expert)
  end

  def hidden
    CollectionGroup.get_ids('hidden').include?(id)
  end

  def system_generated
    user_id == Appo::Constants::NIL_UUID
  end

  def comment_recipients
    all_collaborators
  end

  private

  def destroy_notifications
    Notification.destroy(collection_id: id)
  end

  def track
    Tracking.track :collection_create,
      user: user,
      data: { collection_id: id, name: name }
  end
end
