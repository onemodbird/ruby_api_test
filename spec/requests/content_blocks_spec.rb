require "rails_helper"

describe Appo::Api::ContentBlocks do
  let(:creator) { create :user }
  let(:other) { create :user }
  let(:resource) { create :resource, user: creator }
  let(:content_block) { create :content_block, resource: resource }

  describe "POST /v1/content_blocks" do
    let(:data) { attributes_for(:content_block) }

    it "lets a user create a content_block" do
      api_post "/v1/content_blocks?resource_id=#{resource.id}", creator, data

      expect_response_code_of 201
      expect(resource.content_blocks.count).to eq 1
      expect(json_response).to eq (
        ContentBlockSerializer.serialize(ContentBlock.first).stringify_keys)
    end

    it "prohibits another user from creating a content block" do
      api_post "/v1/content_blocks?resource_id=#{resource.id}", other, data

      expect_response_code_of 403
      expect(json_response["error"]).to eq "Unauthorized"
    end
  end

  describe "DELETE /v1/content_blocks/:id" do
    it "lets a user delete a content_block" do
      api_delete "/v1/content_blocks/#{content_block.id}", creator

      expect_response_code_of 200
      expect(resource.content_blocks.count).to eq 0
      expect(json_response["id"]).to eq content_block.id
    end

    it "prohibits user from deleting another's content_block" do
      api_delete "/v1/content_blocks/#{content_block.id}", other

      expect_response_code_of 403
      expect(json_response["error"]).to eq "Unauthorized"
    end
  end

  describe "PUT /v1/content_blocks/:id" do
    let(:new_content) { "<b>NEW</b>" }
    let(:new_title) { "TITLE YEAH!" }

    def update(user, data)
      api_put "/v1/content_blocks/#{content_block.id}", user, data
      content_block.reload
    end

    it "lets a user update content" do
      expect {
        update(creator, { content: new_content })
      }.not_to change(content_block, :title)

      expect_response_code_of 200
      expect(json_response["id"]).to eq content_block.id
      expect(content_block.content).to eq new_content
    end

    it "lets a user update content and title" do
      update creator, { content: new_content, title: new_title }

      expect(content_block.content).to eq new_content
      expect(content_block.title).to eq new_title
    end

    it "lets a user clear out the title with a blank" do
      update creator, { title: "" }

      expect(content_block.title).to eq nil
    end

    it "prohibits user from updating another's content_block" do
      api_put "/v1/content_blocks/#{content_block.id}", other, { content: "<b>NOPE</b>"}

      expect_response_code_of 403
      expect(json_response["error"]).to eq "Unauthorized"
    end
  end
end
