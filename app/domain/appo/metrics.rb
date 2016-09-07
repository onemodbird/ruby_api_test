module Appo
class Metrics

  def self.stored_metrics
    KeyValue.metrics.value
  end

  def self.rebuild!
    metrics = KeyValue.metrics

    now = Time.zone.now.in_time_zone("America/Chicago")
    archive = KeyValue.create!(key: "metrics-#{now.to_i}", value: metrics.value)

    today = now.beginning_of_day
    start_day = Time.zone.parse(
      metrics.value.first.fetch("timestamp")
    ).in_time_zone("America/Chicago").beginning_of_day


    metrics.value = []
    day = start_day

    while day <= today
      metrics.value << new.collect(day).metrics
      day = day.tomorrow
    end

    metrics.save!
  end

  def initialize
    @metrics = {}
  end

  attr_reader :metrics

  def collect(cutoff = nil)
    unless cutoff
      cutoff = Time.zone.now.in_time_zone('America/Chicago').beginning_of_day
    end

    @metrics[:timestamp] = cutoff
    @metrics[:users] = {
      total: User.where("created_at < ?", cutoff).count,
      google: User.where("created_at < ?", cutoff).where.not(google_id: nil).count,
      twitter: User.where("created_at < ?", cutoff).where.not(twitter_id: nil).count,
      facebook: User.where("created_at < ?", cutoff).where.not(facebook_id: nil).count,
      other: User.where("created_at < ?", cutoff).where(
        google_id: nil,
        twitter_id: nil,
        facebook_id: nil,
      ).count
    }
    @metrics[:resources] = {
      total: Resource.where("created_at < ?", cutoff).count,
      public: Resource.where("created_at < ?", cutoff).where(visibility: 'public').count,
      hidden: Resource.where("created_at < ?", cutoff).where(visibility: 'hidden').count,
      private: Resource.where("created_at < ?", cutoff).where(visibility: 'private').count,
      undefined: Resource.where("created_at < ?", cutoff).where(visibility: 'undefined').count
    }
    @metrics[:collections] = {
      total: Collection.where("created_at < ?", cutoff).count,
      public: Collection.where("created_at < ?", cutoff).where(visibility: 'public').count,
      hidden: Collection.where("created_at < ?", cutoff).where(visibility: 'hidden').count,
      private: Collection.where("created_at < ?", cutoff).where(visibility: 'private').count
    }
    self
  end

  def store!
    raise "No metrics" if @metrics.empty?
    stored_metrics = KeyValue.metrics
    stored_metrics.value << @metrics
    stored_metrics.save!
    self
  end

end
end
