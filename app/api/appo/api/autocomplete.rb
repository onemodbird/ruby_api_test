module Appo
  module Api
    class Autocomplete < Grape::API

      params do
        requires :q, type: String, desc: "Search query"
      end

      desc "Return suggested phrases"
      get :autocomplete do
        results = SearchQueryCounter.top(params[:q])

        { queries: results }
      end

    end
  end
end
