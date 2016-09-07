class CollectionGroup < ActiveRecord::Base
  belongs_to :user
  has_one :featured_collection_group

  HIDDEN_ID = "475bd242-788a-4416-bc0b-90a238db4daf"
  FEATURED_ID = "ce82e077-e033-4d59-91fc-5d3bccf167d6"

  def self.hidden
    find_or_create_by!(id: HIDDEN_ID) do |cg|
      cg.name = 'Hidden'
      cg.user_id = Appo::Utils.console_user.id
    end
  end

  def self.featured
    find_or_create_by!(id: FEATURED_ID) do |cg|
      cg.name = 'Featured'
      cg.user_id = Appo::Utils.console_user.id
    end
  end

  def self.get_ids(name)
    case name.to_sym
    when :hidden
      hidden.collection_ids
    when :featured
      featured.collection_ids
    else
      raise ArgumentError.new("Unsupported Argument: #{name}")
    end
  end


  validates :name, presence: true
  validates :user_id, presence: true

  after_save :reindex_hidden_collections, if: -> { HIDDEN_ID == id }

  def collection_ids
    collections.map { |c| c.fetch('id') }
  end

  def collection_objects
    Collection
      .where(id: collection_ids)
      .to_a
      .sort_by!{ |c| collection_ids.index c.id }
  end

  def featureable_collections
    Collection
    .where(id: collection_ids)
    .where(visibility: "public")
    .where.not(id: self.class.get_ids(:hidden))
    .to_a
    .sort_by!{ |c| collection_ids.index c.id }
  end

  def featured?
    featured_collection_group ? true : false
  end

  private

  def reindex_hidden_collections
    collection_ids_to_reindex =
      (collections_was.to_set ^ collections.to_set).map { |c| c.fetch('id') }

    Collection.where(id: collection_ids_to_reindex).each(&:index!)
  end
end

