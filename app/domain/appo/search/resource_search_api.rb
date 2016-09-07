module Appo
module Search
class ResourceSearchAPI

  def self.search(params = {})
    new(params).search
  end

  def initialize(params = {})
    @params = Params.new_from_params(params)
    @page = params[:page] || 1
    @response = nil
  end

  def search
    @response = Response.new(
      Resource.search(elasticsearch_query).page(@page).per(10)
    )
  end

  private


  def elasticsearch_query
    function_score_query
  end

  def aggregations
    {
      aggs: free_aggregation
            .merge(content_type_aggregation)
            .merge(grade_level_aggregation)
            .merge(group_aggregation)
            .merge(author_aggregation)
    }
  end

  def aggregation(field, plural_field = nil)
    plural_field ||= field
    {
      field.to_sym => {
        filter: {
          and: {
            filters: filters - [send("#{field}_filter")]
          }
        },
        aggs: {
          field.to_sym => {
            terms: { field: plural_field.to_s, size: 0 }
          }
        }
      }
    }
  end

  def author_aggregation
    aggregation(:author)
  end

  def free_aggregation
    aggregation(:free)
  end

  def content_type_aggregation
    aggregation(:content_type)
  end

  def grade_level_aggregation
    aggregation(:grade_level, :grade_levels)
  end

  def group_aggregation
    aggregation(:group, :groups)
  end

  def al_query
    # SearchConfigID: ca086808-36d1-4ecc-aefd-7aa220ae987b
    {
      "query" => {
        "multi_match" => {
          "query" => query,
          "fields" => [
            "common_core_tags^2.0",
            "expanded_grade_levels^0.25",
            "grade_level_groups^0.25",
            "grade_levels^0.25",
            "name^0.1",
            "name_exact^1.0",
            "owner_exact^1.0",
            "tags^2.0"
          ]
        }
      }
    }
  end

  def tags_query
    {
      query: {
        multi_match: {
          'query' => query,
          'fields' => %w(
            grade_levels
            expanded_grade_levels
            tags
          )
        }
      }
    }
    .merge(filter)
    .merge(sort_by_score)
  end

  def function_score_query
    {
      query: {
        function_score: {
          functions: [
            {
              field_value_factor: {
                field: 'score',
                factor: 0.01,
                modifier: 'ln'
              }
            },
            {
              filter: { term: { "author" => "vif" } },
              weight: 0.035
            },
          ],
          boost_mode: 'sum'
        }.merge(selected_query)
      }
    }
    .merge(filter)
    .merge(aggregations)
  end

  def selected_query
    if query.blank?
      match_all_query
    else
      al_query
    end
  end

  def match_all_query
    {
      query: { match_all: {} }
    }
  end

  def keyword_query
    {
      query: { match: { '_all' => query } }
    }
  end

  def filter
    {
      filter: { and: { filters: filters  } }
    }
  end

  def filters
    [
      defunct_filter,
      visibility_filter,
      free_filter,
      content_type_filter,
      grade_level_filter,
      group_filter,
      author_filter,
    ]
    .concat(preprocessor.filters).compact
  end

  def query
    preprocessor.query
  end

  def preprocessor
    @preprocessor ||= Appo::Search::Preprocessor.new(@params.query)
  end

  def defunct_filter
    { term: { 'defunct' => false } }
  end

  def visibility_filter
    { term: { visibility: "public" } }
  end

  def author_filter
    if @params.authors.empty?
      nil
    else
      { terms: { "author" => @params.authors } }
    end
  end

  def free_filter
    { terms: { 'free' => @params.prices } }
  end

  def content_type_filter
    { terms: { 'content_type' => @params.types } }
  end

  def grade_level_filter
    if @params.grades.empty?
      nil
    else
      { terms: { grade_levels: @params.grades } }
    end
  end

  def group_filter
    if @params.groups.empty?
      nil
    else
      { terms: { groups: @params.groups } }
    end
  end

  def sort_by_score
    {
      sort: [
        { score: { order: 'desc'} },
        { _score: { order: 'desc'} }
      ]
    }
  end

end
end
end
