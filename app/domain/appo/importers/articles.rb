module Appo
module Importers
class Articles

  SOURCE_URL = %W[
    https://dataclips.heroku.com/dztzrugebxicqhtfdbxurvnxfkek-2015-EDU-Articles.json
    ?t=#{Time.now.to_i}
  ].join


  def self.import!
    new.import!
  end

  def import!
    blog_posts.each do |blog_post|
      Article.transaction do

        article = Article.find_or_initialize_by(
          blog_post_id: blog_post.fetch('id')
        )
        article.attributes = mapped_blog_post(blog_post)

        if article.changed?
          article.save!
          datum = ImportedDatum.find_or_initialize_by(
            item_type: article.class.name,
            item_id: article.id
          )
          datum.data = blog_post
          datum.save! if datum.changed?
        end

      end
    end

    # At times, articles seem not to get indexed, so make this self-healing
    Article.reindex!
  end

  def blog_posts
    @blog_posts ||= Fetchers::Dataclip.new(SOURCE_URL).rows
  end

  def mapped_blog_post bp
    user = User.find_by_email(bp.fetch('reviewer').fetch('email'))
    {
      id: bp.fetch('uuid'),
      blog_post_id: bp.fetch('id'),
      user_id: user.id,
      title: bp.fetch('title'),
      body: bp.fetch('body'),
      published_at: bp.fetch('published_at'),
      created_at: bp.fetch('created_at'),
      updated_at: bp.fetch('updated_at'),
      excerpt: bp.fetch('excerpt'),
      featured: bp.fetch('featured') ? true : false,
      ipad_app_featured: bp.fetch('ipad_app_featured'),
      ipad_app_position: bp.fetch('ipad_app_position'),
      categories: Array(bp.fetch('categories')).map{ |c|
        [
          c.fetch('top_level_category_group_name'),
          c.fetch('category_group_name'),
          c.fetch('name')
        ]
      },
      app_ids: Array(bp.fetch('apps')).map{ |a|
        id = a.fetch('app_store_id')
        url = "https://itunes.apple.com/app/id#{id}"

        resource = Resource
                     .kind(:app)
                     .find_by_url("https://itunes.apple.com/app/id#{id}")

        if resource.nil?
          resource = Resource.new(kind: 'app', url: url)
          resource.attributes = Appo::Fetchers::App.new(url).resource_data
          resource.save!
        end

        resource.id
      }
    }
  end

end
end
end
