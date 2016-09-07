<<<<<<< HEAD
set :application, "greenprint-api"
set :repo_url, "git@github.com:greenprint/greenprint-api.git"
set :deploy_to, "/home/appo/greenprint-api"
=======
set :application, "participate-api"
set :repo_url, "git@github.com:Participate/participate-api.git"
set :deploy_to, "/home/appo/participate-api"
>>>>>>> parent of 0bd3464... customize to greenprintmedia
set :ssh_options, {
  user: "appo",
  forward_agent: true
}
set :keep_releases, 5
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle')

namespace :deploy do
  # Sigur is having issues with building on Ubuntu 16.04
  # https://github.com/hyperic/sigar/issues/60
  desc "Configure bundler for sigur build"
  task :prepare_bundle_config do
    on roles(:app) do
      execute "cd #{release_path} && bundle config --local build.sigar '--with-cppflags=\"-fgnu89-inline\"'"
    end
  end

  desc "Show debug info"
  task :info do
    on roles(:app) do
      execute "cd #{release_path} && bundle exec ruby -e \"puts ENV.inspect\""
    end
  end

  desc "Start app"
  task :start do
    on roles(:app) do
<<<<<<< HEAD
      execute "cd #{release_path} && bundle exec eye start greenprint-api"
=======
      execute "cd #{release_path} && bundle exec eye start participate-api"
>>>>>>> parent of 0bd3464... customize to greenprintmedia
    end
  end

  desc "Stop app"
  task :stop do
    on roles(:app) do
<<<<<<< HEAD
      execute "cd #{release_path} && bundle exec eye stop greenprint-api"
=======
      execute "cd #{release_path} && bundle exec eye stop participate-api"
>>>>>>> parent of 0bd3464... customize to greenprintmedia
    end
  end

  desc "Restart app"
  task :restart do
    on roles(:app) do
<<<<<<< HEAD
      execute "cd #{release_path} && bundle exec eye restart greenprint-api"
=======
      execute "cd #{release_path} && bundle exec eye restart participate-api"
>>>>>>> parent of 0bd3464... customize to greenprintmedia
    end
  end

  desc "Load eye configuration"
  task :load_eye do
    on roles(:app) do
      execute "cd #{release_path} && bundle exec eye quit && bundle exec eye load config/eye.rb"
    end
  end

  desc "Load eye configuration"
  task :eye_info do
    on roles(:app) do
      execute "cd #{release_path} && bundle exec eye info"
    end
  end

  desc "Re-index models if necessary"
  task :index_on_demand do
    on roles(:db) do
      execute "cd #{release_path} && bundle exec rake elasticsearch:index_on_demand"
    end
  end

end

before "bundler:install", "deploy:prepare_bundle_config"
before "deploy:restart", "deploy:load_eye"
before "deploy:restart", "deploy:index_on_demand"
after  "deploy:publishing", "deploy:migrate"
after  "deploy:publishing", "deploy:restart"
