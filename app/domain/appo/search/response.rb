module Appo
module Search
class Response

  def initialize(elasticsearch_response)
    @response = elasticsearch_response
  end

  def results
    @response.results.map{ |r|
      Appo::Formatters::Resource.format(r)
    }
  end

  def total_pages
    @response.total_pages
  end

  def current_page
    @response.current_page
  end

  def next_page
    @response.next_page
  end

  def prev_page
    @response.prev_page
  end

  def total_count
    @response.total_count
  end

  def paid_count
    price_count("F")
  end

  def free_count
    price_count("T")
  end

  def ios_count
    content_type_count("ios-app")
  end

  def android_count
    content_type_count("android-app")
  end

  def video_count
    content_type_count("video")
  end

  def webpage_count
    content_type_count("webpage")
  end

  def ibook_count
    content_type_count("ibook")
  end

  def price_counts
    boolean_values = { "free" => "T", "paid" => "F" }

    Params::PRICES
    .map { |price| [ price, price_count(boolean_values.fetch(price)) ] }
    .to_h
  end

  def content_type_counts
    Params::TYPES
    .map { |content_type| [ content_type, content_type_count(content_type) ] }
    .to_h
  end

  def grade_level_counts
    Params::GRADES
    .map { |grade| [ grade, grade_level_count(grade) ] }
    .to_h
  end

  def group_counts
    Params::GROUPS
    .map { |group| [ group, group_count(group) ] }
    .to_h
  end

  def author_counts
    Params::AUTHORS
    .map { |author| [ author, author_count(author) ] }
    .to_h
  end

  private

  def price_count(t_or_f)
    aggregation("free", t_or_f)
  end

  def content_type_count(content_type)
    aggregation("content_type", content_type)
  end

  def grade_level_count(grade)
    aggregation("grade_level", grade)
  end

  def group_count(group)
    aggregation("group", group)
  end

  def author_count(author)
    aggregation("author", author)
  end

  def aggregations
    @aggregations ||= @response.response.fetch('aggregations', {})
  end

  def aggregation field, value
    aggregations
    .fetch(field)
    .fetch(field)
    .fetch('buckets')
    .find(->{{}}) { |b| b.fetch('key') == value }
    .fetch('doc_count', 0)
  end

end
end
end
