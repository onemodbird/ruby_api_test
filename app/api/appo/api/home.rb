module Appo
  module Api
    class Home < Grape::API
      route_setting :track, event: :home_view
      get :home do
        subjects = Appo::ResourceTags::SUBJECTS_AND_TOPICS
        grade_levels = Appo::ResourceTags::GRADE_LEVELS
        suggested_searches = KeyValue.suggested_searches.value
        collection_groups =
          FeaturedCollectionGroup
          .collection_groups_for_display

        # FIXME: after the frontend starts using collection_groups, remove
        # the "collections" key from the hash and the code below the generates
        # the collections value
        max = 7
        ids = CollectionGroup.get_ids("featured").take(max)
        collections = Collection.where(id: ids).to_a.sort_by!{ |c| ids.index c.id }

        if collections.size < max
          gap = max - collections.size
          ids += CollectionGroup.get_ids("hidden")
          collections.concat(
            Collection.where.not(id: ids).order("updated_at desc").limit(gap).to_a
          )
        end

        {
          subjects: subjects,
          suggested_searches: suggested_searches,
          grade_levels: grade_levels,
          collections: serialize(collections),
          collection_groups: collection_groups.map { |cg|
            CollectionGroupFeaturedSerializer.new(cg)
          }
        }
      end

    end
  end
end
