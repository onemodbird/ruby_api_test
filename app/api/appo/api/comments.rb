module Appo
  module Api
    class Comments < Grape::API
      params do
        optional :collection_id
        optional :resource_id
        exactly_one_of :collection_id, :resource_id
      end

      resource :comments do
        after_validation do
          @commentable = Commentable.find_by_params(included_params)
          authorize! :comment, @commentable
        end

        desc "View all comments for commentable"
        route_setting :track, event: :comment_list, data: [:collection_id]
        get do
          CommentChainSerializer.new(@commentable)
        end

        desc "Add a comment to a commentable"
        route_setting :track, event: :comment_create, data: [:collection_id]
        params do
          requires :content, type: String
        end
        post do
          @commentable.comment(current_user, included_params.content)
        end
      end

      resource "comments/:id" do
        after_validation do
          @comment = Comment.find(params[:id])
          @commentable = @comment.commentable
        end

        desc "Delete a comment"
        route_setting :track, event: :comment_delete, data: [:id]
        delete do
          authorize! :delete, @comment

          @comment.destroy
          body false
        end

        desc "Updates a comment"
        route_setting :track, event: :comment_update, data: [:id]
        params do
          requires :content, type: String
        end
        put do
          authorize! :update, @comment

          @comment.update(content: params[:content])
          body false
        end
      end
    end
  end
end
