class Admin::SearchQueriesController < Admin::AdminController

  before_action :authorize_superuser!

  def index
    field = if params[:field].present?
      "via.#{params[:field]}"
    else
      'count'
    end

    @queries =
      SearchQueryCounter
        .top_for_admin(nil, 10_000, field: field)
        .fetch('hits')
        .fetch('hits')
        .map{|h| h.fetch('_source')}

    @queries = SearchQueryCounter.top_for_admin(nil, 10_000, field: field).fetch('hits').fetch('hits').map{|h| h.fetch('_source')}


    @fields = @queries.flat_map{|q| q.fetch('via').to_a }
                      .reduce({}){|h,f| k=f.first ; v=f.last ; h[k] = h.fetch(k,0) + v ; h}
                      .to_a.sort_by(&:first)
  end

end
