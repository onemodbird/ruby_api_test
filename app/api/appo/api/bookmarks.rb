module Appo
  module Api
    class Bookmarks < Grape::API

      resources :bookmarks do

        desc "List bookmarks"
        route_setting :track, event: :bookmark_list
        get do
          authorize! :read, Bookmark

          bookmarks =
            Bookmark
            .where(user_id: current_user.id)
            .order(updated_at: :desc)

          { bookmarks: serialize(bookmarks) }
        end

        desc "Add a bookmark"
        route_setting :track, event: :bookmark_create, data: :url
        params do
          requires :url, type: String, allow_blank: false
          optional :title, type: String, allow_blank: false
          optional :favicon_url, type: String, allow_blank: false
        end
        post do
          authorize! :create, Bookmark

          bookmark =
            Bookmark
            .create_with(
              url: params[:url],
              title: params[:title],
              favicon_url: params[:favicon_url])
            .find_or_initialize_by(
              user_id: current_user.id,
              normalized_url: Appo::URI.clean(params[:url]))

          bookmark.new_record? ? bookmark.save! : bookmark.touch
          bookmark
        end

        route_param :id do
          desc "Delete a bookmark"
          route_setting :track, event: :bookmark_delete, data: :id
          delete do
            bookmark = Bookmark.find(params[:id])
            authorize! :destroy, bookmark
            bookmark.destroy!

            body false
          end
        end

      end

    end
  end
end
