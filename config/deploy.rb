lock "~> 3.18.0"

set :application, "chat_app"
set :repo_url, "git@github.com:Jay991/ruby_chat_app.git"

set :deploy_to, "/home/rails/chat_app"

append :linked_files, "config/database.yml", "config/master.key"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "public/uploads"

set :keep_releases, 5

namespace :deploy do
  after 'deploy:publishing', 'deploy:restart'
  task :restart do
    invoke 'puma:restart'
  end
end
