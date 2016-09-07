class FeaturedCollectionGroup < ActiveRecord::Base
  belongs_to :collection_group

  validates :collection_group_id, :position, presence: true
  validates :visible, inclusion: [true, false]

  def self.for_display
    where(visible: true)
    .order(:position)
  end

  def self.collection_groups_for_display
    for_display
    .includes(:collection_group)
    .map(&:collection_group)
  end

end
