require "rails_helper"

describe Appo::Api::Comments do
  [:creator, :collaborator, :subscriber, :other].each do |user|
    let(user) { create :user, :registered }
  end
  let(:collection) { create :collection, user: creator }
  let(:resource) { create :resource, user: creator }
  let(:content) { "Yay a comment." }

  describe "GET /v1/comments" do
    context "with a commented collection" do
      before { collection.comment(creator, content) }

      it "shows all comments" do
        api_get "/v1/comments?collection_id=#{collection.id}", creator

        expect_response_code_of 200
        expect(json_response["comments"].count).to eq 1
      end

      it "prohibits viewing comments" do
        api_get "/v1/comments?collection_id=#{collection.id}", other

        expect_response_code_of 403
      end
    end

    context "with a commented resource" do
      before { resource.comment(creator, content) }

      it "shows comments" do
        api_get "/v1/comments?resource_id=#{resource.id}", other

        expect_response_code_of 200
        expect(json_response["comments"].count).to eq 1
      end
    end
  end

  context "with a collaborator" do
    let(:collaborator_comment) { collection.comment(collaborator, content) }

    before do
      collaboration = Collaboration.invite!(collection, emails: collaborator.email)[0]
      collaboration.confirm(collaborator, collaboration.token)
    end

    describe "GET /v1/comments" do
      it "shows collaborator comments in order" do
        collection.comment(creator, "One")
        Timecop.freeze(10.minutes)
        collection.comment(collaborator, "Two")

        api_get "/v1/comments?collection_id=#{collection.id}", collaborator

        expect(json_response["comments"].map{ |c| c["content"]}).to eq ["One", "Two"]
      end
    end

    describe "POST /v1/comments" do
      it "lets users comment on a collection" do
        api_post "/v1/comments?collection_id=#{collection.id}", collaborator, { content: content }

        expect_response_code_of 201
        expect(Comment.count).to eq 1
        expect(json_response["content"]).to eq content
      end

      it "lets users comment on a resource" do
        api_post "/v1/comments?resource_id=#{resource.id}", other, { content: content }

        expect_response_code_of 201
        expect(Comment.count).to eq 1
        expect(json_response["content"]).to eq content
      end

      it "sends to all collaborators in realtime" do
        collection.subscribe(subscriber.id)

        expect_realtime :comment_created,
          to: collection.all_collaborators,
          excluding: [collaborator, subscriber]

        api_post "/v1/comments?collection_id=#{collection.id}", collaborator, { content: content }
      end

      it "serializes user info back on comment creation" do
        api_post "/v1/comments?collection_id=#{collection.id}", collaborator, { content: content }
        expect(json_response).to have_key "user"
      end

      it "prohibits a user from commenting on a collection" do
        api_post "/v1/comments?collection_id=#{collection.id}", other, { content: content }

        expect_response_code_of 403
        expect(json_response["error"]).to eq "Unauthorized"
      end
    end

    describe "DELETE /v1/comments/:id" do
      it "lets a commenter delete their comment" do
        api_delete "/v1/comments/#{collaborator_comment.id}", collaborator

        expect_response_code_of 204
        expect(Comment.count).to eq 0
        expect(response.body).to be_empty
      end

      it "prohibits user from deleting another's comment" do
        api_delete "/v1/comments/#{collaborator_comment.id}", other

        expect_response_code_of 403
        expect(json_response["error"]).to eq "Unauthorized"
      end
    end

    describe "PUT /v1/comments/:id" do
      it "lets a commenter update their comment" do
        collaborator_comment # touch

        time = Timecop.freeze(10.minutes)
        api_put "/v1/comments/#{collaborator_comment.id}", collaborator, { content: "New"}

        expect_response_code_of 204
        expect(response.body).to be_empty
      end
    end
  end
end
