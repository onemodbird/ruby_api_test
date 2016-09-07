class SyncGnipStreamRulesJob
  include Sidekiq::Worker

  def perform
    GnipService.rules.add(rules_to_add)
    GnipService.rules.remove(rules_to_remove)
  end

  private

  def live_rules
    @live_rules ||= GnipService.rules.get.map(&:downcase)
  end

  def new_rules
    @new_rules ||= Chat.current.pluck(:name).map(&:downcase)
  end

  def rules_to_add
    new_rules - live_rules
  end

  def rules_to_remove
    live_rules - new_rules
  end

end
