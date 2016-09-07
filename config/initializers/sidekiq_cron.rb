# Sidekiq cron load
unless (Rails.env.development? || Rails.env.test?)
  schedule_file = "config/sidekiq_cron.yml"

  if File.exists?(schedule_file) && Sidekiq.server?
    Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
  end
end
