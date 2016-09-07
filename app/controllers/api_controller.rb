class APIController < ApplicationController
  before_action :get_user_via_auth_token

  private

  rescue_from CanCan::AccessDenied do |exception|
    render :text => 'Unauthorized', :status => 403, :layout => false
  end

  def get_user_via_auth_token
    if params[:auth_token].present?
      @current_user = User.find_by_auth_token(params.delete(:auth_token))
    end
  end

  def require_user
    unless @current_user
      render :json => { error: "Invalid auth token" }, status: 403
    end
  end

  def current_user
    @current_user
  end

end
