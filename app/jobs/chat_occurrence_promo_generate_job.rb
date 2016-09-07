class ChatOccurrencePromoGenerateJob
  include Sidekiq::Worker

  def perform
    ChatPromo.generate
  end
end
