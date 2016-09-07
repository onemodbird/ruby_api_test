require "rails_helper"

describe ChatSerializer do
  let(:chat) {
    create :chat, :with_schedule,
      current_qa_session_id: qa_session_id,
      moderators: {
        person: {
          id: "12345",
          twitter_profile_image_url: "http://whatever.com" }}}
  let(:serialized) { ChatSerializer.serialize(chat) }
  let(:qa_session_id) { SecureRandom.uuid }

  [:id, :name, :description, :featured].each do |field|
    it "includes #{field}}" do
      expect(serialized[field]).to eq(chat.public_send(field))
    end
  end

  it "includes channel" do
    expect(serialized[:channel]).to eq("public-m-chat-#{chat.id}")
  end

  it "includes archived status" do
    expect(serialized[:archived_at]).to eq(nil)
  end

  it "includes moderators" do
    expect(serialized[:moderators]).to eq [{ twitter_handle: "person", twitter_profile_image_url: "http://whatever.com", user: nil }]
  end

  it "includes schedule occurrences" do
    all_occurrence_ids = chat.schedule_occurrences.pluck(:id)
    serialized_occurrence_ids =
      serialized[:schedule_occurrences].map { |so| so.fetch(:id) }

    expect(serialized_occurrence_ids).to_not be_empty
    expect(all_occurrence_ids).to include(*serialized_occurrence_ids)
  end

  it "includes the schedule definition" do
    schedule = serialized[:schedule]
    expect(schedule.keys).to include(*:start_time, :end_time, :rrules)
    expect(schedule[:rrules].size).to eq(2)
  end

  it "handle nil schedules without error" do
    expect { ChatSerializer.serialize(create :chat) }.not_to raise_error
  end

end
