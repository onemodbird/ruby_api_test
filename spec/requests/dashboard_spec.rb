require "rails_helper"

describe Appo::Api::Dashboard do
  let(:user) {
    create :user, :registered, :with_assignments, :with_assignment_tasks,
      :with_recent_chats, :with_badge_assertions, :with_learning_products
  }

  it "summarizes user info" do
    stub_assignments_data
    api_get "/v1/dashboard", user

    expect_response_code_of 200
    resp = json_response
    expect(resp["assignments"].count).to eq 2
    expect(resp["recent_chats"].count).to eq 1

    badges = resp["recent_badge_assertions"]
    expect(badges.length).to eq 1
    expect(badges[0]["user_id"]).to eq user.id

    task = user.assignment_detail_tasks[0]
    recent_assignment = resp["recent_in_progress_assignment"]
    expect(recent_assignment).to be_present
    expect(recent_assignment["assignment"]["id"]).to eq task.assignment_detail.assignment.id

    content = json_response["recent_content"]
    expect(content.size).to eq 2
    expect(content[0]["kind"]).to eq "learning_product"
  end

end
