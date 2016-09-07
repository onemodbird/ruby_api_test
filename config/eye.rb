require_relative "../config/initializers/_secrets"

Eye.config do
  mail host: Secrets.mailgun.host, domain: Secrets.mailgun.domain, port: Secrets.mailgun.port, user: Secrets.mailgun.user, password: Secrets.mailgun.password
  contact :errors, :mail, "admin@participate.com"
end

<<<<<<< HEAD
Eye.application "greenprint-api" do
=======
Eye.application "participate-api" do
>>>>>>> parent of 0bd3464... customize to greenprintmedia
  notify :errors
  stdall "log/eye.log"
  clear_bundler_env

  environment = ENV["RAILS_ENV"]

  if environment == "development"
    working_dir File.expand_path("../..", __FILE__)
  else
<<<<<<< HEAD
    working_dir "/home/appo/greenprint-api/current"
=======
    working_dir "/home/appo/participate-api/current"
>>>>>>> parent of 0bd3464... customize to greenprintmedia
  end

  process :sidekiq do
    pid_file "tmp/pids/sidekiq.pid"
    start_command "bundle exec sidekiq --config config/sidekiq.yml --daemon --logfile log/sidekiq.log"
    stop_command "bundle exec sidekiqctl shutdown tmp/pids/sidekiq.pid"
    stdall "log/sidekiq.log"
    daemonize true
    check :memory, every: 30.seconds, below: 700.megabytes, times: 4
  end

  process :unicorn do
    pid_file "tmp/pids/unicorn.pid"
    start_command "bundle exec unicorn -E #{environment} -Dc config/unicorn.rb"
    stop_command "kill -QUIT {PID}"
    restart_command "kill -USR2 {PID}"
    start_timeout 100.seconds
    restart_grace 30.seconds
    monitor_children do
      stop_command "kill -QUIT {PID}"
      check :cpu, every: 30.seconds, below: 80, times: 3
      check :memory, every: 30.seconds, below: 500.megabytes, times: 4
    end
    check :memory, every: 30.seconds, below: 200.megabytes, times: 4
  end

  process :tweet_streamer do
    pid_file "tmp/pids/tweet_streamer.pid"
    start_command "bundle exec ruby lib/tweet_streamer.rb"
    stop_signals [:TERM, 2.seconds, :KILL]
    stdall "log/tweet_streamer.log"

    daemonize true
  end

end
