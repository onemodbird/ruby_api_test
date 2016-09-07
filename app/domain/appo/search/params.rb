module Appo
  module Search
    class Params

      PRICES = %w(free paid)
      TYPES = %w(
        ios-app
        android-app
        video
        webpage
        ibook
        activity
        unit
        lesson-plan
      )
      GRADES = ResourceTags::GRADES
      GROUPS = %w(oer)
      AUTHORS = %w(vif expert community)

      attr_reader :query, :types, :prices, :grades, :groups, :authors

      class << self
        def new_from_params(params)
          new(
            query: params[:q],
            types: array_or_default(params[:types], TYPES),
            grades: array_or_default(params[:grades], []),
            prices: to_free_boolean(array_or_default(params[:prices], PRICES)),
            groups: array_or_default(params[:groups], []),
            authors: array_or_default(params[:authors], []),
          )
        end

        def array_or_default(value, default_value)
          if value.present?
            if value.is_a?(Array)
              value
            else
              value.to_s.split(',')
            end
          else
            default_value
          end
        end

        def to_free_boolean(prices)
          prices.map { |p| { 'free' => true, 'paid' => false }.fetch(p) }
        end
      end

      def initialize(query:, types:, prices:, grades:, groups:, authors:)
        @query = query
        @types = types
        @prices = prices
        @grades = grades
        @groups = groups
        @authors = authors
      end

      def default?(param)
        send(param) == defaults.fetch(param)
      end

      def defaults
        @defaults ||=
          {
            grades: [],
            types: TYPES,
            prices: self.class.to_free_boolean(PRICES),
            groups: [],
            authors: [],
          }
      end
    end
  end
end
