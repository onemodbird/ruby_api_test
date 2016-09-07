set :stage, :staging
set :branch, ENV["branch"] || "develop"
role :app, %w(staging-api-02.participate.com)
role :web, %w(staging-api-02.participate.com)
role :db, %w(staging-api-02.participate.com)
