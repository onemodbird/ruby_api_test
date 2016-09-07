class Admin::BadgesController < ApplicationController

  before_action :not_production!

  def index
    @collections = Collection.where(visibility: "protected").order(:name)
  end

  def not_production!
    if Rails.env.production?
      flash[:alert] = "Sorry, you are not allowed to access that action"
      redirect_to admin_path
    end
  end
end
