class SearchQueryCounter

  def self.create_index!
    client = Elasticsearch::Client.new

    client.indices.create({
      index: 'search_query_counters',
      body: {
        settings: {
          number_of_shards: 1,
          number_of_replicas: 0
        },
        mappings: {
          search_query_counter: {
            properties: {
              query: {
                type: 'string',
                index: 'not_analyzed',
                include_in_all: false
              },
              count: {
                type: 'integer',
                include_in_all: false
              },
              via: {
                type: 'object',
                include_in_all: false
              },
              suggest: {
                type: 'completion',
                analyzer: 'whitespace',
                search_analyzer: 'whitespace'
              }
            }
          }
        }
      }
    })
  end

  def self.recreate_index!
    Elasticsearch::Client.new.indices.delete index: 'search_query_counters'
    create_index!
  end

  def self.log(query, via)
    new(query, via: via).log
  end

  def self.get(query)
    new(query).get
  end

  def self.top(query = nil, size = 10)
    new(query, size).top
  end

  def self.top_for_admin(query = nil, size = 10, from = 0, field: nil)
    new(query, size, from).top_for_admin(field: field)
  end

  def self.suggest(query = nil, size = 10)
    new(query, size).top_via_suggest
  end

  def initialize(query, size = 10, from = 0, via: nil)
    @query = query.to_s.strip.downcase
    @via = via ? via.to_s.strip.sub(/(?:Paged)+\z/, 'Paged') : 'unknown'

    unless @via =~ /\A[-A-Za-z]+\z/
      raise "Invalid via argument for SearchQueryCounter: '#{via}'"
    end

    @size = size
    @from = from
    @client = Elasticsearch::Client.new
    @index = 'search_query_counters'
    @type = 'search_query_counter'
    @id = Digest::MD5.hexdigest(@query)
    @retry_attempts = 3
    @response = nil
  end

  attr_reader :client

  def get
    @response = @client.get index: @index, type: @type, id: @id
    @response.fetch('_source')
  end

  def log
    @response = @client.update log_params
  end

  def top
    top_via_suggest
    #top_via_prefix_filter
  end

  def top_for_admin(field: nil)
    @response = @client.search top_params(field: field)
  end

  def top_via_prefix_filter
    @response = @client.search top_params
    @response.fetch('hits')
             .fetch('hits')
             .map{|h| h.fetch('_source') }
             .map{|c| c.fetch('query') }
  end

  def top_via_suggest
    @response = @client.suggest(
      index: @index,
      body: {
        autocomplete: {
          text: @query,
          completion: {
            field: 'suggest',
            size: @size
          }
        }
      }
    )
    @response.fetch('autocomplete', [])
             .first
             .to_h
             .fetch('options', [])
             .map{|o| o.fetch('text') }
  end

  def top_params(field: 'count')
    {
      index: @index,
      type: @type,
      size: @size,
      from: @from,
      body: {
        filter: {
          prefix: { query: @query }
        },
        sort: [
          { field => 'desc' },
          { query: 'asc' }
        ]
      }
    }
  end

  def log_params
    {
      index: @index,
      type: @type,
      id: @id,
      retry_on_conflict: @retry_attempts,
      body: {
        #script_file: 'search-query-counter',
        #lang: 'groovy',
        script: %[
          src = ctx._source
          src.count += 1
          src.via[via] = (src.via[via] ? src.via[via] : 0) + 1
          src.suggest.weight = src.via['input']
        ],
        params: {
          via: @via
        },
        upsert: {
          query: @query,
          count: 1,
          via: { @via => 1},
          suggest: {
            input: @query,
            weight: 1
          }
        }
      }
    }
  end

end
