set :output, "log/cron-whenever.log"

every 1.day, at: '7:00am', roles: [:db] do
  runner 'Appo::Metrics.new.collect.store!'
end
