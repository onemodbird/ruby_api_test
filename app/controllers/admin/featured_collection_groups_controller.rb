class Admin::FeaturedCollectionGroupsController < Admin::AdminController

  before_action :authorize_superuser!

  def index
    @featured_collection_groups =
      FeaturedCollectionGroup
      .includes(:collection_group)
      .order(:position)
  end

  def create
    FeaturedCollectionGroup.create!(create_params)
    redirect_to admin_featured_collection_groups_path
  end

  def destroy
    FeaturedCollectionGroup.find(params[:id]).destroy!
    redirect_to admin_featured_collection_groups_path
  end

  def update
    FeaturedCollectionGroup.find(params[:id]).update!(update_params)
    redirect_to admin_featured_collection_groups_path
  end

  def reorder
    ids = params[:ids].split(",")

    FeaturedCollectionGroup.transaction do
      FeaturedCollectionGroup
      .all
      .to_a
      .sort_by! { |fcg| ids.index(fcg.id) }
      .each_with_index { |fcg, i| fcg.position = i }
      .select { |fcg| fcg.changed? }
      .each { |fcg| fcg.save! }
    end

    flash[:notice] = "Order Saved"
    redirect_to admin_featured_collection_groups_path
  end

  private

  def create_params
    params.permit(:collection_group_id).merge({
      position: FeaturedCollectionGroup.maximum(:position).to_i + 1
    })
  end

  def update_params
    params.permit(:visible, :position)
  end
end
