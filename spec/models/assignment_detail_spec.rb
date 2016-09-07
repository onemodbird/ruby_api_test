require "rails_helper"

RSpec.describe AssignmentDetail, type: :model do
  let(:user) { create :user}
  let(:assignment) { create :assignment, :with_badge_requirements, user: user }
  let(:detail) { assignment.detail_for_resource(assignment.assignable) }

  before(:each) do
    stub_assignments_data
  end

  describe "interactions" do

    it "assigns user to detail" do
      expect(detail.user).to eq user
    end

    it "maps badge requirements to interactions" do
      one = detail.interactions["one"]
      expect(one).to be_present
      expect(one.title).to eq "Title One"
      expect(one.form.sections.length).to eq 2

      two = detail.interactions["two"]
      expect(two).to be_present
      expect(two.title).to eq "Title Two"
      expect(two.form.sections.length).to eq 1
    end

    it "creates a progress task" do
      task = detail.add_task user, "one", "progress", { input_a1: "awesome", input_b1: "cool" }

      expect(task).to be_valid
      expect(task.kind).to eq "progress"
    end

    it "updates detail state" do
      detail.add_task user, "one", "progress", { input_a1: "awesome", input_b1: "cool" }

      expect(detail.state).to eq "progress"
    end

    it "does not create a progress task for an invalid interaction" do
      expect {
        detail.add_task user, "three", "progress", { input_a1: "awesome" }
      }.to raise_error("Unknown interaction 'three'")
    end

    it "does not create a progress task for an invalid input" do
      expect {
        detail.add_task user, "one", "progress", { input_x1: "awesome" }
      }.to raise_error("Data has invalid inputs")
    end

    it "does not create a progress task if interaction is already complete" do
      detail.add_task user, "two", "progress", { input_z1: "superb" }

      expect {
        detail.add_task user, "two", "progress", { input_z1: "even more superb???" }
      }.to raise_error("Interaction 'two' is already complete")
    end

    it "merges progress from different assignment detail tasks" do
      detail.add_task assignment.user, "one", "progress", { input_a1: "awesome" }
      detail.add_task assignment.user, "one", "progress", { input_b1: "super duper" }
      detail.add_task assignment.user, "two", "progress", { input_z1: "great" }

      expect(detail.progress).to eq({ "one" => { "input_a1" => "awesome", "input_b1" => "super duper" }, "two" => { "input_z1" => "great" }})
    end

    it "creates a progress task, lesson plan resource, and complete task on completion" do
      detail.add_task user, "one", "progress", { input_a1: "excellent", input_b1: "fantastic" }
      detail.add_task user, "one", "progress", { input_b2: { filename: "pixel.png", type: "image/png", path: test_file_path, tempfile: test_file }}

      expect(AssignmentDetailTask.pluck(:kind)).to eq ["progress", "progress", "complete"]
      complete_task = AssignmentDetailTask.where(kind: "complete").first
      expect(complete_task.resource).to be_present

      content_blocks = complete_task.resource.content_blocks
      expect(content_blocks.size).to eq 8
      expect(content_blocks[0].title).to eq "Section A"
      expect(content_blocks[1].content).to match(/Input A-1/)
      expect(content_blocks[2].content).to match(/excellent/)
      expect(content_blocks[3].title).to eq "Section B"
      expect(content_blocks[4].content).to match(/Input B-1/)
      expect(content_blocks[5].content).to match(/fantastic/)
      expect(content_blocks[6].content).to match(/Input B-2/)
      expect(content_blocks[7].kind).to eq "file"
      expect(content_blocks[7].uploaded_file.file.to_s).to match(/pixel.png/)
    end

    it "sanitizes content in lesson plan resource" do
      detail.add_task user, "one", "progress", { input_a1: "dirty", input_b1: dirty_html }
      detail.add_task user, "one", "progress", { input_b2: { filename: "pixel.png", type: "image/png", path: test_file_path, tempfile: test_file }}

      block = Resource.where(kind: "learning_product").first.content_blocks[5]
      expect(block.content).to eq clean_html
    end

    it "earns badges on completion if there are badge requirements" do
      detail.add_task user, "one", "progress", { input_a1:  "excellent", input_b1: "fantastic" }
      detail.add_task user, "one", "progress", { input_b2: { filename: "pixel.png", type: "image/png", path: test_file_path, tempfile: test_file }}
      badge_requirement = assignment.assignable.badge_requirements[0]

      assertion = user.badge_assertions.first
      expect(assertion).to be_present
      expect(assertion.badge_requirement).to eq badge_requirement
      expect(assertion.badge).to eq badge_requirement.badge
      expect(assertion.artifact).to be_present
      expect(assertion.artifact.kind).to eq "learning_product"

      task = detail.assignment_detail_tasks.where(kind: "complete").first
      expect(task.data).to eq({ "badge_assertion_id" => assertion.id })
    end

    it "does not earn badges without completion" do
      detail.add_task user, "one", "progress", { input_a1: "excellent", input_b1: "fantastic" }

      expect(user.badge_assertions).to be_blank
    end

  end
end
