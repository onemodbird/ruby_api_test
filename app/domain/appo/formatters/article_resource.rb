module Appo
module Formatters
class ArticleResource

  def initialize resource
    @resource = resource
  end

  attr_reader :resource

  def to_h
    {
      id: resource.fetch('id'),
      name: resource.fetch('name'),
      image_url: resource.fetch('image_url'),
      url: resource.fetch('url'),
      score: resource.fetch('score')
    }
  end

end
end
end
