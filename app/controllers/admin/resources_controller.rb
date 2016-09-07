class Admin::ResourcesController < Admin::AdminController

  before_action :authorize_superuser!, only: [:destroy]

  def index
    kinds_map = {'App' => 'app', 'Video' => 'video', 'Webpage' => 'webpage'}
    kind_options = kinds_map.keys

    if params[:resources]
      kinds = kind_options & filters[:kind]
      prices = filters[:price]
      tags_approved = filters[:tags_approved]
      cc_tags_approved = filters[:cc_tags_approved]
      sort = filters[:sort]
      tag_like = filters[:tag_like]
      with = filters[:with].reject(&:blank?)
    else
      kinds = kinds_map.keys
      prices = 'Both'
      tags_approved = 'Both'
      cc_tags_approved = 'Both'
      sort = 'Updated'
      tag_like = nil
      with = []
    end

    @resources = Resource.where(
      kind: kinds.map{ |k|
        kinds_map.fetch(k)
      }
    )

    case prices
    when 'Free'
      @resources = @resources.where(price: 'Free')
    when 'Paid'
      @resources = @resources.where.not(price: 'Free')
    end

    case tags_approved
    when 'Approved'
      @resources = @resources.merge(Resource.with_tags_approved)
    when 'Unapproved'
      @resources = @resources.merge(Resource.without_tags_approved)
    end

    case cc_tags_approved
    when 'Approved'
      @resources = @resources.merge(Resource.with_common_core_tags_approved)
    when 'Unapproved'
      @resources = @resources.merge(Resource.without_common_core_tags_approved)
    end

    if tag_like.present?
      @resources = @resources.merge(Resource.with_tag_like(tag_like))
    end

    if with.include?('Duplicate Reviews')
      @resources = @resources.merge(Resource.with_duplicate_reviews)
    end

    if with.include?('Defunct')
      @resources = @resources.merge(Resource.defunct)
    end

    if with.include?('OER')
      @resources = @resources.where(oer: true)
    end

    order_by = {
      'Updated'   => 'updated_at desc',
      'Created'   => 'created_at desc',
      '# Reviews' => 'jsonb_array_length(reviews) desc',
      '# CC Tags' => 'jsonb_array_length(common_core_tags) desc'
    }.fetch(sort, 'updated_at desc')

    @resources = @resources.order(order_by).page(params[:page]).per(20)
  end

  def create

    resource_factory = Appo::ResourceFactory.new(
      create_params[:url],
      attributes: { kind: create_params[:kind] }
    )

    if resource_factory.resource_exists?
      flash.keep[:info] = "#{create_params[:url]} already exists"
      redirect_to [:admin, resource_factory.resource]
      return
    end

    @resource = resource_factory.resource

    if webpage_confirmation_required? || !@resource.valid?
      render :new
      return
    end

    @resource = resource_factory.resource_with_data_fetch
    @resource.visibility = 'public'

    if @resource.transaction { @resource.save }
      redirect_to [:admin, @resource]
    else
      render :edit
    end
  end

  def show
    @resource = Resource.find(params[:id])
  end

  def edit
    @resource = Resource.find(params[:id])
  end

  def update
    @resource = Resource.find(params[:id])

    @resource.attributes = resource_params
    if @resource.save
      redirect_to [:admin, @resource]
    else
      render :edit
    end
  rescue ActiveRecord::RecordNotUnique => e
    if e.message =~ /index_resources_on_url/
      flash[:error] = 'The URL provided is already in use and must be unique'
      render :edit
    else
      raise
    end
  end

  def destroy
    resource = Resource.find(params[:id])
    resource.transaction do
      unless resource.reviews.empty?
        review_ids = resource.reviews.map{|r| r.fetch('id')}
        Review.where(id: review_ids).destroy_all
      end
      resource.destroy!
    end
    redirect_to admin_resources_path
  end

  def flags
    @resource = Resource.find(params[:id])
    params[:flags].each do |k,v|
      case v
      when 'true'
        @resource.flags[k.to_s] = true
      when 'false'
        @resource.flags[k.to_s] = false
      else
        raise "Invalid flag value: #{v}"
      end
    end

    if 'true' == params[:auto_tag]
      @resource.grade_levels = @resource.combined_grade_levels
    end

    @resource.save!
    if request.xhr?
      head :ok
    else
      flash[:notice] = 'Flag approved.'
      redirect_to :back
    end
  end

  private

  def filters
    params.require(:resources).permit(
      :tags_approved,
      :cc_tags_approved,
      :price,
      :sort,
      :tag_like,
      :kind => [],
      :with => []
    )
  end

  def create_params
    params.require(:resource).permit(:kind, :url)
  end

  def resource_params
    permitted_fields = [
      :tags,
      :subject_tags,
      :topic_tags,
      :description,
      :oer,
      {
        :common_core_tags => [],
        :grade_levels => []
      }
    ]

    if @resource.kind == 'webpage'
      permitted_fields.unshift(:name)

      if current_user.superuser?
        permitted_fields.unshift(:url)
      end
    end

    params.require(:resource).permit(permitted_fields)
  end

  def webpage_confirmation_required?
    if @resource.kind == 'webpage'
      create_params[:kind] != 'webpage'
    else
      false
    end
  end

end
