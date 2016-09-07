FactoryGirl.define do
  factory :chat_occurrence_summary do
    transcript
    schedule_occurrence {
      build(:schedule_occurrence, schedulable: transcript.chat)
    }
  end
end
