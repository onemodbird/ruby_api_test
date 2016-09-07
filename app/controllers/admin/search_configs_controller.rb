class Admin::SearchConfigsController < Admin::AdminController

  before_action :authorize_superuser!

  def index
    @search_configs = SearchConfig.order(updated_at: :desc)
                                  .page(params[:page])
                                  .per(20)
  end

  def new
    @search_config = SearchConfig.new
    if @search_config.config.empty?
      @search_config.config = base_config
    end
    @fields = fields
  end

  def create
    @search_config = SearchConfig.new
    @search_config.attributes = search_config_params
    @search_config.user_id = current_user.id
    @search_config.save!
    redirect_to admin_search_configs_path
  rescue JSON::ParserError
    flash[:error] = "Malformed config"
    render :new
  end

  def edit
    @search_config = SearchConfig.find(params[:id])
    @fields = fields
  end

  def update
    @search_config = SearchConfig.find(params[:id])
    @search_config.update_attributes!(search_config_params)
    redirect_to admin_search_configs_path
  rescue JSON::ParserError
    flash[:error] = "Malformed config"
    render :edit
  end

  private

  def fields
    @fields ||= Resource.full_mapping
                        .fetch('resources')
                        .fetch('mappings')
                        .fetch('resource')
                        .fetch('properties')
                        .select{|k,v| v.fetch('type', false) == 'string'}
                        .reject{|k,v|
                          %w(
                            content_type
                            id
                            image_url
                            kind
                            os
                            price
                            screenshot_urls
                            type
                            url
                          ).include?(k)
                        }
                        .keys
                        .sort
  end

  def base_config
    {
      "query" => {
        "multi_match" => {
          "query" => "QUERY",
          "fields" => []
        }
      }
    }
  end

  def search_config_params
    params.require(:search_config).permit(*[
      :name,
      :config
    ])
  end
end
