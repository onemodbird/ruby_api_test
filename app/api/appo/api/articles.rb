module Appo
  module Api
    class Articles < Grape::API

      resource :articles do

        desc "List of all articles (advisor articles by default)"
        params do
          optional :channel,
            type: String,
            values: %w(advisor blog)
        end
        get do
          filters = [{ term: { published: true } }]
          if p.channel
            filters << { term: { channel: p.channel } }
          end

          articles = Article.search({
            filter: { and: { filters: filters } },
            sort: { published_at: "desc" },
            size: 51
          })
          .results
          .map{|a| a.fetch("_source")}

          users = User.mget(articles.map{|a| a.fetch("user_id")})

          { articles:
              articles
                .each_with_index
                .map {|a, i| Appo::Formatters::Article.new(a, users[i]).to_h }}
        end

        route_param :id do
          get do
            article = Article.get(params[:id])
            raise ActiveRecord::RecordNotFound if article["published_at"].nil?
            { article: Appo::Formatters::Article.new(article).to_h }
          end
        end

      end
    end
  end
end
