module Searchable
  extend ActiveSupport::Concern

  SETTINGS = {
    index: {
      number_of_shards: 1,
      number_of_replicas: 0,
      analysis: {
        filter: {
          english_possessive_stemmer: {
            type: "stemmer",
            language: "possessive_english"
          },
          english_stopwords: {
            type: "stop",
            language: "_english_"
          },
          english_minimal_stemmer: {
            type: "stemmer",
            language: "minimal_english"
          },
          autocomplete_filter: {
            type: "ngram",
            min_gram: 1,
            max_gram: 20
          }
        },
        analyzer: {
          autocomplete: {
            tokenizer: "standard",
            filter: [ "lowercase", "autocomplete_filter" ]
          },
          lowercase_keyword: {
            type: "custom",
            tokenizer: "keyword",
            filter: "lowercase"
          },
          default: {
            tokenizer: "standard",
            filter: [
              "english_possessive_stemmer",
              "lowercase",
              "english_stopwords",
              "english_minimal_stemmer",
            ]
          }
        }
      }
    }
  }

  included do
    include Elasticsearch::Model
    after_commit -> { __elasticsearch__.index_document  }, on: :create
    after_commit -> { __elasticsearch__.index_document  }, on: :update
    after_commit -> { __elasticsearch__.delete_document }, on: :destroy
  end

  class_methods do
    def create_index!
      __elasticsearch__.create_index! force: true
    end

    def refresh_index!
      __elasticsearch__.refresh_index!
    end

    def reindex!
      create_index!
      import
    end

    def index!(id)
      find(id).index!
    end

    def get id
      __elasticsearch__.client.get(
        index: __elasticsearch__.index_name,
        id: id
      )
      .fetch("_source")
    end

    def mget ids
      __elasticsearch__.client.mget(
        index: __elasticsearch__.index_name,
        body: { ids: ids }
      )
      .fetch("docs")
      .map{|d| d.fetch("_source") }
    end

    def full_mapping
      __elasticsearch__.client.indices.get_mapping index: index_name
    end
  end

  def index!
    __elasticsearch__.index_document
  end

end
