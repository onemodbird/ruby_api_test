class Admin::SearchController < Admin::AdminController

  helper_method :search_config_id

  def index
    @search_configs = SearchConfig.order(:name)
    @resources = []

    if params[:search]

      if params.fetch(:search, {})[:sort] == 'Relevancy'
        q = relevancy_query
      elsif params.fetch(:search, {})[:sort] == 'Score'
        q = relevancy_query.merge(sort_by_score)
      else
        q = function_score_query
      end

      @resources = Resource
                    .search(q)
                    .page(params[:page])
                    .per(20)
                    .records
    end
  end

  private

  def relevancy_query
    query.merge(filter)
  end

  def function_score_query
    {
      query: {
        function_score: {
          field_value_factor: {
            field: 'score',
            factor: 0.01,
            modifier: 'ln'
          },
          boost_mode: 'sum'
        }.merge(query)
      }
    }.merge(filter)
  end

  def sort_by_score
    {
      sort: [
        { score: { order: 'desc'} },
        { _score: { order: 'desc'} }
      ]
    }
  end

  def query
    if query_param.blank?
      query_match_all
    elsif search_config
      query = search_config.config
      query.fetch('query').fetch('multi_match').store('query', query_param)
      query
    else
      if 'Tag Fields' == params.fetch(:search, {})[:search_field]
        query_tags
      else
        query_all
      end
    end
  end

  def query_match_all
    {
      query: { match_all: {} }
    }
  end

  def query_all
    {
      query: { match: { '_all' => query_param } }
    }
  end

  def query_tags
    {
      query: {
        multi_match: {
          'query' => query_param,
          'fields' => %w(
            grade_levels
            expanded_grade_levels
            tags
          )
        }
      }
    }
  end

  def filter
    {
      filter: { and: { filters: [
                free_filter,
                content_type_filter
              ].concat(preprocessor.filters).compact } }
    }
  end

  def preprocessor
    #params[:search][:query]
    @preprocessor ||= Appo::Search::Preprocessor.new(params[:search][:query])
  end

  def content_type_filter
    if params.has_key?(:search)
      filter = params.fetch(:search).fetch(:content_type).map { |type|
        case type
        when 'iOS Apps' then 'ios-app'
        when 'Android Apps' then 'android-app'
        when 'Videos' then 'video'
        when 'Websites' then 'webpage'
        end
      }.compact.uniq
    else
      filter = ['ios-app', 'android-app', 'video', 'webpage']
    end

    { terms: { 'content_type' => filter } }
  end

  def free_filter
    if params.has_key?(:search)
      free = params.fetch(:search, {}).fetch(:price, []).include?('Free')
      paid = params.fetch(:search, {}).fetch(:price, []).include?('Paid')
    else
      free = true
      paid = true
    end

    filter = []
    filter << true if free
    filter << false if paid

    { terms: { 'free' => filter } }
  end

  def query_param
    #params[:search][:query]
    preprocessor.query
  end

  def search_config_id
    @search_config_id ||= (
      params[:search_config_id] ||
      params.fetch(:search, {})[:search_config_id]
    )
  end

  def search_config
    @search_config ||= SearchConfig.find_by_id(search_config_id)
  end
end
