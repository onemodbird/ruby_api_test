class Admin::TagGroupsController < Admin::AdminController

  before_action :authorize_superuser!

  def index
    @tag_groups = TagGroup.order(name: :asc)
  end

  def new
    @tag_group = TagGroup.new
  end

  def create
    @tag_group = TagGroup.create(tag_group_params.merge(
      tags: tag_group_params[:tags_text].split("\n").map(&:strip)
    ))
    if @tag_group.persisted?
      redirect_to admin_tag_groups_path
    else
      render :new
    end
  end

  def edit
    @tag_group = TagGroup.find(params[:id])
    if @tag_group.tags_text.blank?
      @tag_group.tags_text = @tag_group.tags.join("\n")
    end
  end

  def update
    @tag_group = TagGroup.find(params[:id])
    @tag_group.attributes = tag_group_params
    @tag_group.tags = tag_group_params[:tags_text].split("\n").map(&:strip)
    if @tag_group.save
      redirect_to admin_tag_groups_path
    else
      render :edit
    end
  end

  private

  def tag_group_params
    params.require(:tag_group).permit(*[
      :name,
      :tags_text
    ])
  end
end
