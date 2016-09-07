class ChatOccurrenceSummary < ActiveRecord::Base
  belongs_to :transcript
  belongs_to :schedule_occurrence

  def self.generate(chat_occurrence)
    summary = new
    summary.schedule_occurrence_id = chat_occurrence.id
    summary.moderators = chat_occurrence.schedulable.moderators
    summary.create_transcript

    summary.tap{ |summary| summary.save! }
  end

  def create_transcript
    self.transcript = Transcript.create(
      user_id: Appo::Constants::NIL_UUID,
<<<<<<< HEAD
      name: "greenprint Chat transcript for #{schedule_occurrence.schedulable.name}",
=======
      name: "Participate Chat transcript for #{schedule_occurrence.schedulable.name}",
>>>>>>> parent of 0bd3464... customize to greenprintmedia
      begin_at: schedule_occurrence.start_time,
      end_at: schedule_occurrence.end_time,
      chat_id: schedule_occurrence.schedulable_id
    ).tap{ |transcript| transcript.generate_collection }

    self.analytics = self.transcript.analytics
  end

  def recalculate_analytics
    update_attribute(:analytics, transcript.analytics)
  end

  def for_chat(chat)
    ChatOccurrenceSummary.where(schedule_occurrence_id: chat.schedule_occurrences)
  end

  def rebuild!
    transcript.collection.destroy
    transcript.destroy
    create_transcript
    recalculate_analytics
  end
end
