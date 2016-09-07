module Appo
  module Formatters
    class Article

      @@markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new)

      def self.markdown
        @@markdown
      end

      def initialize(article, user = nil)
        @article = article
        @user = user
      end

      def user
        @user || User.get(@article.fetch("user_id"))
      end

      def to_h
        {
          id: @article.fetch('id'),
          title: @article.fetch('title'),
          published_at: @article.fetch('published_at'),
          excerpt: @article.fetch('excerpt'),
          body: @@markdown.render(@article.fetch('body').to_s),
          user: Appo::Formatters::ArticleUser.new(user).to_h,
          channel: @article.fetch('channel')
        }
      end

    end
  end
end
