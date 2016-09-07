module Appo
  module Search
    class CollectionQuery

      def initialize(params: nil, tag: nil, min_resources_count: nil)
        @params = params || Params.new_from_params({})

        @query = {
          query: default_query,
          filter: default_filter,
          sort: default_sort
        }

        process_query if preprocessor.query.present?
        process_tag(tag) if tag.present?
        process_prices unless @params.default?(:prices)
        process_types unless @params.default?(:types)
        process_grades unless @params.default?(:grades)
        process_groups unless @params.default?(:groups)
        process_authors unless @params.default?(:authors)

        process_preprocessor
        process_minimum(min_resources_count) unless min_resources_count.to_i == 0
        process_sort(preprocessor.query.blank?)
      end

      def to_h
        @query
      end

      private

      def default_query
        { match_all: {} }
      end

      def default_sort
        [ { _score: { order: 'desc'} } ]
      end

      def default_filter
        { and: {
          filters: [
            { term: { hidden: false } },
            { term: { visibility: 'public' } },
            { term: { system_generated: false }}
          ] }
        }
      end

      def process_query
        @query[:query] = {
          multi_match: {
            query: preprocessor.query,
            fields: %w(
              name^1.0
              tags^1.0
              description^0.25
              resources.name^0.5
              resources.tags^0.5
            )
          }
        }
      end

      def process_prices
        add_or_update_terms_filter("resources.free", @params.prices)
      end

      def process_types
        add_or_update_terms_filter("resources.kind", @params.types)
      end

      def process_grades
        add_or_update_terms_filter("grade_levels", @params.grades)
      end

      def process_groups
        add_or_update_terms_filter("groups", @params.groups)
      end

      def process_authors
        add_or_update_terms_filter("resources.author", @params.authors)
      end

      def process_tag(tag)
        @query[:filter][:and][:filters] << {
          term: {
            "tags.keyword" => tag.strip.downcase
          }
        }
      end

      def process_minimum(min_resources_count)
        @query[:filter][:and][:filters] << {
          range: {
            resources_count: {
              gte: min_resources_count.to_i
            }
          }
        }
      end

      def process_preprocessor
        mappings = {
          content_type: "resources.kind",
          grade_levels: "grade_levels",
          common_core_tags: "resources.common_core_tags"
        }

        preprocessor.filter_values.each do |field, terms|
          add_or_update_terms_filter(mappings.fetch(field), terms)
        end
      end

      def add_or_update_terms_filter(name, values)
        filter = @query[:filter][:and][:filters].find do |f|
          f.has_key?(:terms) && f[:terms].has_key?(name)
        end

        if filter
          filter[:terms][name] += values
        else
          @query[:filter][:and][:filters] << {
            terms: {
              name => values
            }
          }
        end
      end

      def process_sort(browse)
        op = browse ? :unshift : :push # If browsing, prepend timestamp order
        @query[:sort].send(op, { timestampi: { order: 'desc'} } )
      end

      def preprocessor
        @preprocessor ||= Appo::Search::Preprocessor.new(@params.query)
      end
    end
  end
end
