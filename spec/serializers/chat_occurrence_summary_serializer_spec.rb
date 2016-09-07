require "rails_helper"

describe ChatOccurrenceSummarySerializer do
  let(:chat_occurrence_summary) { create :chat_occurrence_summary }
  let(:serialized) { ChatOccurrenceSummarySerializer.serialize(chat_occurrence_summary) }

  it "includes schedule occurrences" do
    expect(serialized[:schedule_occurrence][:id])
      .to eq(chat_occurrence_summary.schedule_occurrence.id)
  end
end
