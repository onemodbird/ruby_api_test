class SearchSerializer < BaseSerializer
  attributes :page, :counts, :results, :collections

  def page
    {
      total: resources.total_pages,
      current: resources.current_page,
      next: resources.next_page,
      prev: resources.prev_page
    }
  end

  def counts
    {
      total: resources.total_count,
      prices: resources.price_counts,
      types: resources.content_type_counts,
      grades: resources.grade_level_counts,
      groups: resources.group_counts,
      authors: resources.author_counts,
    }
  end

  def results
    resources.results
  end

  def collections
    coll = (object[:collections] || []).as_json
    coll.each do |c|
      c["preview"] = true
      c["resources"].each do |r|
        r.slice! "id", "name", "image_url"
      end
    end
    coll
  end


  private

  def resources
    object[:resources]
  end

end
