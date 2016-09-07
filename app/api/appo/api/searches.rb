module Appo
  module Api
    class Searches < Grape::API

      COLLECTIONS_MIN_RESOURCES_COUNT = 5
      COLLECTIONS_PER_PAGE = 2

      params do
        optional :q, type: String, desc: "Search query"
        optional :prices, type: String, values: Appo::Search::Params::PRICES
        optional :types, type: String, values: Appo::Search::Params::TYPES
        optional :grades, type: String, values: Appo::Search::Params::GRADES
        optional :groups, type: String, values: Appo::Search::Params::GROUPS
        optional :authors, type: String, values: Appo::Search::Params::AUTHORS
        optional :page, type: Integer, desc: "Page"
        optional :via, type: String
      end

      desc "Search resources and collections"

      route_setting :track, event: :search, data: [:q, :prices, :types, :grades, :groups, :authors, :page, :via]

      get :search, serializer: SearchSerializer do
        response = Appo::Search::ResourceSearchAPI.search(params)
        SearchQueryCounter.log(params[:q], params[:via])

        collections = Collection.search(
          Appo::Search::CollectionQuery.new(
            params: Appo::Search::Params.new_from_params(params),
            min_resources_count: COLLECTIONS_MIN_RESOURCES_COUNT
          ).to_h
        )
        .page(params[:page])
        .per(COLLECTIONS_PER_PAGE)
        .results
        .map{ |r| r.fetch("_source") }

        { resources: response, collections: collections }
      end

    end
  end
end
