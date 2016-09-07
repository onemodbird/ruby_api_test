class SuggestedSearchesController < APIController
  def index
    suggested_searches = KeyValue.suggested_searches.value
    render json: { suggested_searches: suggested_searches }
  end
end
