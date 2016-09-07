module Appo
  module Api
    class ContentBlocks < Grape::API
      resource :content_blocks do
        params do
          requires :resource_id
        end

        after_validation do
          @resource = Resource.find(p.resource_id)
          authorize! :update, @resource
        end

        desc "Add a content_block to a resource"
        route_setting :track, event: :content_block_create, data: [:resource_id]
        params do
          optional :title, type: String, desc: "Title or 'anchor name' of block"
          requires :kind, type: String, values: ContentBlock::KINDS,
            desc: "Kind of block (#{ContentBlock::KINDS.join(', ')}"
          requires :content, type: String, desc: "Contents of block"
        end
        post do
          ContentBlock.create!(included_params)
        end
      end

      resource "content_blocks/:id" do
        after_validation do
          @content_block = ContentBlock.find(params[:id])
          authorize! :update, @content_block.resource
        end

        desc "Delete a content_block"
        route_setting :track, event: :content_block_delete, data: [:id]
        delete do
          @content_block.destroy!
          { success: true, id: @content_block.id }
        end

        desc "Updates a content_block"
        route_setting :track, event: :content_block_update, data: [:id]
        params do
          optional :content, type: String, allow_blank: true, desc: "Updated content"
          optional :title, type: String, desc: "Updated title (empty or null to clear)"
          at_least_one_of :content, :title
        end
        put do
          @content_block.update!(included_params)
          @content_block
        end
      end
    end
  end
end
