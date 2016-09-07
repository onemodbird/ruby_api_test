class Admin::CollectionGroupsController < Admin::AdminController

  before_action :authorize_superuser!

  def create
    collection_group = CollectionGroup.create! create_params
    flash[:notice] = 'Collection Group created'
    redirect_to edit_admin_collection_group_path(collection_group)
  end

  def index
    @collection_group = CollectionGroup.new
    @collection_groups =
      CollectionGroup
      .includes(:featured_collection_group)
      .where(user_id: Appo::Utils.console_user.id)
      .order(:name)
  end

  def edit
    @collection_group = CollectionGroup.find(params[:id])
  end

  def update
    @collection_group = CollectionGroup.find(params[:id])
    @collection_group.attributes = update_params
    @collection_group.save!
    flash[:notice] = 'Collection Group saved'
    redirect_to admin_collection_groups_path
  end

  private

  def create_params
    params.require(:collection_group).permit(:name).merge({
      user_id: Appo::Utils.console_user.id
    })
  end

  def update_params
    params.require(:collection_group).permit(:name, collections: [:id]).merge({
      collections: (
        params[:collection_group][:collections]
          .scan(Appo::Regex::UUID)
          .map{|id| { 'id' => id } }
      )
    })
  end
end
