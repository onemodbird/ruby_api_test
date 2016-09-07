class Admin::ReviewsController < Admin::AdminController

  before_action :authorize_superuser!, only: [:destroy]
  before_action :find_resource
  before_action :find_review, except: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new review_params_for_create
    if Appo::Transactors::CreateReview.new(@resource, @review).create
      redirect_to [:admin, @resource]
    else
      render :new
    end
  end

  def edit
  end

  def update
    @review.attributes = review_params
    if Appo::Transactors::UpdateReview.new(@resource, @review).update
      redirect_to [:admin, @resource]
    else
      render :edit
    end
  end

  def destroy
    Appo::Transactors::ReviewDestroyer.new(@resource, @review).destroy!
    redirect_to [:admin, @resource]
  end

  private

  def find_resource
    @resource = Resource.find(params[:resource_id])
  end

  def find_review
    @review = Review.find_by!(resource_id: @resource.id, id: params[:id])
  end

  def review_params
    params.require(:review).permit(*[
      :content_score,
      :feature_score,
      :engagement_score,
      :comment
    ]).merge({
      expert: review_user.expert?
    })
  end

  def review_params_for_create
    review_params.merge(
      user_id: review_user_id,
      resource_id: @resource.id
    )
  end

  def review_user
    @review_user ||=
      begin
        if current_user.superuser? && params[:review][:user_id].present?
          User.find params[:review][:user_id]
        else
          current_user
        end
      end
  end

  def review_user_id
    review_user.id
  end

end
