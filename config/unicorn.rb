env = ENV['RAILS_ENV'] || "development"

if env == "development"
  app_path = File.expand_path("../..", __FILE__)
else
<<<<<<< HEAD
  app_path =  "/home/appo/greenprint-api/current"
=======
  app_path =  "/home/appo/participate-api/current"
>>>>>>> parent of 0bd3464... customize to greenprintmedia
end

stderr_path "#{app_path}/log/unicorn.stderr.log"
stdout_path "#{app_path}/log/unicorn.stdout.log"

listen "127.0.0.1:8080", backlog: 64

worker_processes 2
preload_app true
working_directory app_path
pid "tmp/pids/unicorn.pid"

# Set the bundle location to the latest working directory
before_exec do |server|
  ENV['BUNDLE_GEMFILE'] = "#{app_path}/Gemfile"
end

# zero downtime
before_fork do |server, worker|
  ActiveRecord::Base.connection.disconnect! if defined?(ActiveRecord::Base)

  # Before forking, kill the master process that belongs to the .oldbin PID.
  # This enables 0 downtime deploys.
  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end

after_fork do |server, worker|
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord::Base)
end
