class Admin::SuggestedSearchesController < Admin::AdminController

  before_action :authorize_superuser!

  def index
    @suggested_searches = KeyValue.suggested_searches.value
  end

  def edit
    @suggested_searches = KeyValue.suggested_searches
  end

  def update
    @suggested_searches = KeyValue.suggested_searches
    @suggested_searches.value = suggested_searches_params
                                  .fetch(:value)
                                  .split(/$/)
                                  .map(&:strip)
                                  .reject(&:blank?)
    @suggested_searches.save!
    redirect_to admin_suggested_searches_path
  end

  private

  def suggested_searches_params
    params.require(:suggested_searches).permit(:value)
  end

end
