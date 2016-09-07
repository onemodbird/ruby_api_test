require "rails_helper"

describe Appo::Api::Assignments do
  let(:other) { create :user }
  let(:user) { create :user }

  context "with a schoool and learners" do
    let(:school) { create :school,
      :with_users, :with_admin, :with_assignments, user_count: 2 }
    let(:learner) { school.learners.first }
    let(:admin) { school.admins.first }

    it "lists assignments for my organization" do
      api_get "/v1/assignments", admin, organization_id: school.id

      # collection with 1 resource, and a resource
      expect(json_response.count).to eq 4
      expect(json_response.map{|assn| assn["user_id"]}) =~
        school.users.map(&:id)
    end

    it "does not allow me to list assignments for another organization" do
      api_get "/v1/assignments", other, organization_id: school.id
      expect_response_code_of 403
    end

    it "does not allow me to list assignments for organization if not an admin" do
      api_get "/v1/assignments", learner, organization_id: school.id
      expect_response_code_of 403
    end
  end

  context "with a school" do
    let(:organization) { create :school, :with_admin }
    let(:admin) { organization.admins.first }

    describe "GET /v1/assignments" do
      it "requires a user or organization to list assignments" do
        api_get "/v1/assignments", user

        expect_response_code_of 400
        expect(json_response["error"]).to_not be_nil
      end

      it "lists my assignments" do
        assignment = create :assignment, user: user
        api_get "/v1/assignments", user, user_id: user.id

        expect(json_response.count).to eq 1
        expect(json_response.first["id"]).to eq assignment.id
        expect(json_response.first["assignable"]["name"]).to eq(
          assignment.assignable.name)
      end

      it "lists assignments alphabetically" do
        assignments = create_list :assignment, 3, user: user
        api_get "/v1/assignments", user, user_id: user.id

        names = assignments.map{ |asgn| asgn.assignable.name }.sort
        expect(json_response.map{|asgn| asgn["assignable"]["name"]}).to eq names
      end

      it "allows an admin to view a user's assignments" do
        organization.add_user(user)
        api_get "/v1/assignments", admin, user_id: user.id

        expect_response_code_of 200
      end

      it "disallows a user from viewing a random user's assignments" do
        api_get "/v1/assignments", admin, user_id: user.id

        expect_response_code_of 403
      end

      it "requires a user to be logged in to view assignments" do
        get "/v1/assignments"

        expect_response_code_of 403
      end
    end

    describe "GET /v1/assignments/resource" do

      it "allows a user to view their own assignment" do
        assignment = create :assignment, user: user
        api_get "/v1/assignments/resource/#{assignment.assignable.resources[0].id}", user

        expect_response_code_of 200
        expect(json_response["id"]).to eq assignment.id
        expect(json_response["assignable"]["name"]).to eq(
          assignment.assignable.name)
      end

      it "does not allow a user to view another user's assignment" do
        assignment = create :assignment, user: other
        api_get "/v1/assignments/resource/#{assignment.assignable.resources[0].id}", user

        expect_response_code_of 403
      end

    end

    describe "POST /v1/assignments" do
      let(:resource) { create :resource, :course }
      let(:collection) { create :collection }

      def post_assignment(assignable, poster: user, user_id: user.id)
        params = {
          user_id: user_id,
          assignable_type: assignable.assignable_type,
          assignable_id: assignable.id
        }

        api_post "/v1/assignments", poster, params
      end

      it "allows me to create a resource assignment" do
        post_assignment(resource)

        expect_response_code_of 201
        expect(user.assignments.count).to eq 1
        expect(user.assignments.first.assignable_id).to eq resource.id
        expect(json_response["assignable"]["id"]).to eq resource.id
      end

      it "allows me to create a collection assignment" do
        post_assignment(collection)

        expect_response_code_of 201
        expect(user.assignments.count).to eq 1
        expect(user.assignments.first.assignable_id).to eq collection.id
        expect(json_response["assignable"]["id"]).to eq collection.id
        expect(json_response["assignable"]["resources"].count).to eq(
          collection.resources.count)
      end

      it "requires a user_id" do
        post_assignment(resource, user_id: "")

        expect_response_code_of 400
      end

      it "requires a user to be logged in to create assignments" do
        post "/v1/assignments"

        expect_response_code_of 403
      end

      it "does not recreate an assignment" do
        2.times { post_assignment(resource) }
        expect(user.assignments.count).to eq 1
      end

      it "allows an admin to create an assignment" do
        organization.add_user(user)

        post_assignment(collection, poster: admin)

        expect_response_code_of 201
        expect(user.assignments.count).to eq 1
      end

      it "disallows a user from creating a random user's assignment" do
        post_assignment(resource, poster: admin)

        expect_response_code_of 403
      end
    end

    describe "DELETE /v1/assignments" do
      let(:assignment) { create :assignment, user: user }
      let(:other_assignment) { create :assignment, user: other }

      it "allows me to delete an assignment" do
        api_delete "/v1/assignments/#{assignment.id}", user

        expect(user.assignments).to be_empty
      end

      it "does not allow me to delete another's assignments" do
        api_delete "/v1/assignments/#{other_assignment.id}", user

        expect_response_code_of 403
        expect(other.assignments.count).to eq 1
      end

      it "allows an admin to delete an assignment" do
        organization.add_user(user)
        api_delete "/v1/assignments/#{assignment.id}", admin

        expect_response_code_of 200
        expect(user.assignments).to be_empty
      end

      it "disallows a user from deleting a random user's assignment" do
        api_delete "/v1/assignments/#{assignment.id}", admin

        expect_response_code_of 403
      end
    end
  end

  describe "tasks & interactions" do

    before(:each) do
      stub_assignments_data
    end

    describe "POST /v1/assignments/:id/tasks" do
      let(:assignment) { create :assignment, :with_badge_requirements, user: user }

      it "creates assignment detail progress tasks" do
        api_post "/v1/assignments/#{assignment.id}/tasks", user, {
          resource_id: assignment.assignable_id,
          task: { interaction: "one", kind: "progress", data: { input_a1: "hello", input_b1: "greetings" }}}

        expect_response_code_of 201
        task = assignment.assignment_details[0].assignment_detail_tasks[0]
        expect(task.user).to eq user
        expect(task.interaction).to eq "one"
        expect(task.data).to eq({ "input_a1" => "hello", "input_b1" => "greetings" })
      end

      it "creates uploaded files for assignment detail progress tasks" do
        api_post "/v1/assignments/#{assignment.id}/tasks", user, {
          resource_id: assignment.assignable_id,
          task: { interaction: "one", kind: "progress", data: { input_a1: "some text", input_b2: test_rack_file }}}

        expect_response_code_of 201
        uploaded_file = UploadedFile.find(json_response["data"]["input_b2"]["id"])
        expect(uploaded_file.user_id).to eq user.id
        expect(uploaded_file.file.to_s).to match(/pixel.png/)
      end

      it "does not allow another user to create assignment detail tasks" do
        api_post "/v1/assignments/#{assignment.id}/tasks", other, {
          resource_id: assignment.assignable_id,
          task: { interaction: "one", kind: "progress", data: { input_a1: "oh hai", input_b1: "kthxbai" }}}

        expect_response_code_of 403
      end

      it "responds with completion task & associated resource after submitting all tasks" do
        api_post "/v1/assignments/#{assignment.id}/tasks", user, {
          resource_id: assignment.assignable_id,
          task: { interaction: "one", kind: "progress", data: { input_a1: "awesome", input_b1: "cool" }}}

        api_post "/v1/assignments/#{assignment.id}/tasks", user, {
          resource_id: assignment.assignable_id,
          task: { interaction: "one", kind: "progress", data: { input_b2: test_rack_file }}}

        expect_response_code_of 201
        expect(json_response["kind"]).to eq "complete"
        expect(json_response["data"]["badge_assertion_id"]).to be_present

        resource = json_response["resource"]
        expect(resource).to be_present
        expect(Resource.find(resource["id"]).user).to eq user
      end

    end

  end
end
