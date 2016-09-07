class Admin::AdminController < ApplicationController

  before_action :authenticate_user!
  around_action :use_central_time_zone

  private

  def authorize_superuser!
    if !current_user.superuser?
      flash[:alert] = "Sorry, you are not allowed to access that action"
      redirect_to admin_path
    end
  end

  def use_central_time_zone
    Time.use_zone("America/Chicago") do
      yield
    end
  end
end
