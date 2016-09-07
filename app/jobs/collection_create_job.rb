class CollectionCreateJob
  include Sidekiq::Worker

  def perform(transcript_id)
    transcript = Transcript.find(transcript_id)
    transcript.generate_collection
  end
end
