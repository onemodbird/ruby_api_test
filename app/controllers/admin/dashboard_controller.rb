class Admin::DashboardController < Admin::AdminController

  helper_method :user

  def index
    @resources = Resource.where([
      %[
        (
          resources.user_id = ?
          OR
          resources.id IN (
            SELECT DISTINCT reviews.resource_id
            FROM reviews
            WHERE reviews.user_id = ?
          )
        )
        AND kind IN ('app', 'video', 'webpage')
      ],
      user.id,
      user.id
    ])
    .order(updated_at: :desc)
    .page(params[:page])
    .per(20)
  end

  private

  def user
    @user ||= User.find(user_id)
  end

  def user_id
    if current_user.superuser? && user_id_param.present?
      user_id_param
    else
      current_user.id
    end
  end

  def user_id_param
    params.fetch(:admin, {}).fetch(:user_id, nil)
  end

end
