require "rails_helper"

module Appo
  module Search
    describe CollectionQuery do

      def term_filter_value(collection_query, filter_key)
        collection_query
        .to_h
        .fetch(:filter)
        .fetch(:and)
        .fetch(:filters)
        .find { |f| f.has_key?(:term) && f[:term].has_key?(filter_key) }
        .fetch(:term)
        .fetch(filter_key)
      end

      def terms_filter_value(collection_query, filter_key)
        collection_query
        .to_h
        .fetch(:filter)
        .fetch(:and)
        .fetch(:filters)
        .find { |f| f.has_key?(:terms) && f[:terms].has_key?(filter_key) }
        .fetch(:terms)
        .fetch(filter_key)
      end

      def query(collection_query)
        collection_query
        .to_h
        .fetch(:query)
        .fetch(:multi_match)
        .fetch(:query)
      end

      it "searches tags in a case-insensitive manner" do
        cq = CollectionQuery.new(tag: "STEM")
        expect(term_filter_value(cq, "tags.keyword")).to eq("stem")
      end

      it "filters for collections with public visibility" do
        cq = CollectionQuery.new
        expect(term_filter_value(cq, :visibility)).to eq("public")
      end

      it "filters out editorially hidden collections" do
        cq = CollectionQuery.new
        expect(term_filter_value(cq, :hidden)).to eq(false)
      end

      it "filters out system generated collections" do
        cq = CollectionQuery.new
        expect(term_filter_value(cq, :system_generated)).to eq(false)
      end

      describe "preprocessing" do
        it "filters for resource kind" do
          params = Params.new_from_params(q: "X for iPad")
          cq = CollectionQuery.new params: params

          expect(query(cq)).to eq("X")
          expect(terms_filter_value(cq, "resources.kind")).to eq(%w(ios-app))
        end

        it "appends kind filters if they are already present" do
          params = Params.new_from_params(q: "X for iPad", types: "video")
          cq = CollectionQuery.new params: params

          expect(query(cq)).to eq("X")
          expect(terms_filter_value(cq, "resources.kind"))
          .to eq(%w(video ios-app))
        end

        it "filters for grade level" do
          params = Params.new_from_params(q: "4th Grade X")
          cq = CollectionQuery.new params: params

          expect(query(cq)).to eq("X")

          expect(terms_filter_value(cq, "grade_levels"))
          .to eq(%w(4th))
        end

        it "appends grade filters if they are already present" do
          params = Params.new_from_params(q: "4th Grade X", grades: "3rd")
          cq = CollectionQuery.new params: params

          expect(query(cq)).to eq("X")

          expect(terms_filter_value(cq, "grade_levels"))
          .to eq(%w(3rd 4th))
        end

        it "filters for common core" do
          common_core_tag = "CCSS.Math.Content.4.NBT.A.1"
          params = Params.new_from_params(q: common_core_tag)
          cq = CollectionQuery.new params: params

          expect(cq.to_h.fetch(:query)).to eq({ match_all: {} })

          expect(terms_filter_value(cq, "resources.common_core_tags"))
          .to eq([common_core_tag.downcase])
        end
      end
    end
  end
end
