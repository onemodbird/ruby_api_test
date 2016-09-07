module Appo
  module Api
    class Resources < Grape::API

      resources :resources do

        params do
          requires :user_id, type: String
          optional :page, type: Integer, default: 1
          optional :per, type: Integer, default: 25, values: 1..25
        end
        get do
          user = User.find(p.user_id)

          resources = Resource.where(user_id: p.user_id)
          resources = resources.where(visibility: "public") if user != current_user
          resources = resources.order("created_at DESC").page(p.page).per(p.per)

          {
            user: UserSimpleSerializer.serialize(user),
            results: ResourceSimpleSerializer.list(resources),
            count: resources.total_count,
            page: {
              total: resources.total_pages,
              current: p.page
            }
          }
        end

        params do
          optional :url, type: String, allow_blank: false, regexp: %r{\Ahttps?://}
          optional :file, type: Rack::Multipart::UploadedFile
          optional :content, type: Array do
            requires :kind, values: ContentBlock::KINDS
            optional :title, type: String
            optional :content, type: String
            optional :file, type: Rack::Multipart::UploadedFile
            optional :uploaded_file_id, type: String
          end
          exactly_one_of :url, :file, :content

          optional :name, type: String
        end
        post do
          authorize! :create, Resource

          if params[:content]
            resource = Resource.new_with_content(params, current_user)

          else
            factory = params[:file] ?
              Appo::ResourceFactory.from_file(params[:file], current_user.id) :
              Appo::ResourceFactory.new(params[:url])

            resource = factory.resource_with_data_fetch
            resource.user_id = current_user.id
          end

          resource.save!

          PrerenderHelper.update_record! resource

          resource
        end

        get "trending" do
          Rails.cache.fetch("resources/trending", expires_in: 5.minutes) do
            ResourceSimpleSerializer.list(Resource.trending)
          end
        end

        # Existing resources
        route_param :id do

          get do
            resource = Resource.find(params[:id])
            authorize! :read, resource

            resource
          end


          # Updates

          params do
            requires :name, type: String
            optional :description, type: String
            optional :owner, type: String
            optional :image_url, type: String
            optional :tags, type: Array
            optional :grade_levels, type: Array
            optional :oer, type: Boolean
          end

          put do
            resource = Resource.find(params[:id])
            authorize! :update, resource

            resource.update_attributes included_params

            PrerenderHelper.update_record! resource

            resource
          end

        end
      end
    end
  end
end
