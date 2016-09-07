class CollectionSerializer < BaseSerializer

  attributes :id, :name, :description, :tags, :common_core_tags, :created_at, :updated_at, :visibility
  attributes :counts, :timestamp, :timestampi, :expert, :hidden, :resources_count, :permissions
  attributes :user, :resources, :collaborators, :channel, :subscribed, :grade_levels
  attributes :groups, :system_generated

  has_many :collaborations

  # Remove private attributes for public viewing
  def filter(keys)
    if can?(:manage, object)
      keys
    else
      keys - [:collaborations]
    end
  end

  def collaborators
    object
    .collaborators
    .map { |c| UserSimpleSerializer.new(c, scope: scope).serializable_hash }
  end

  def resources
    CollectionResourceDecoratorSerializer
      .list(collection_resources.first(50), scope: scope)
  end

  def channel
    RealtimeService.channel_name(object, true)
  end

  private

  def collection_resources
    object.collection_resources.includes(:resource)
  end

  def groups
    grps = []
    grps << "oer" if object.resources.any?(&:oer?)
    grps
  end

  def grade_levels
    preprocessed = Appo::Search::Preprocessor.new(object.name)
    preprocessed.filter_values[:grade_levels] || resource_grade_levels
  end

  def resource_grade_levels
    object.resources.inject(Set.new) do |set, resource|
      set.merge resource.correct_grade_levels
      set
    end.to_a
  end
end
