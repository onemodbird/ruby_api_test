module Appo
  module Api
    class Reviews < Grape::API

      resources :reviews do

        # Create

        params do
          requires :review, type: Hash do
            requires :resource_id, type: String
            requires :content_score, type: Integer
            requires :feature_score, type: Integer
            requires :engagement_score, type: Integer
            requires :comment, type: String
          end
        end

        post do
          authorize! :create, Review

          resource = Resource.find(included_params.review.resource_id)
          review = Review.new(included_params.review.merge(:user_id => current_user.id))
          Appo::Transactors::CreateReview.new(resource, review).create

          review
        end


        # Update

        params do
          requires :review, type: Hash do
            optional :content_score, type: Integer
            optional :feature_score, type: Integer
            optional :engagement_score, type: Integer
            optional :comment, type: String
          end
        end

        route_param :id do
          put do
            review = Review.find(params[:id])
            authorize! :update, review

            review.attributes = included_params.review
            resource = Resource.find(review.resource_id)
            Appo::Transactors::UpdateReview.new(resource, review).update

            review
          end
        end

      end
    end
  end
end
