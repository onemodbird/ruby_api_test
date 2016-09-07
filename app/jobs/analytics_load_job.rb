class AnalyticsLoadJob
  include Sidekiq::Worker
  sidekiq_options queue: "import"

  def perform(user_id)
    Tracking.load(User.find(user_id))
  end
end
