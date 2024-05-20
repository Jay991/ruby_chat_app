# config/puma.rb

workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = Integer(ENV['RAILS_MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

rackup DefaultRackup
port ENV['PORT'] || 3000
environment ENV['RACK_ENV'] || 'production'
ENV['CHAT_APP_DATABASE_PASSWORD'] ||= '65fd7c82b85f955a476a3001e87137fd'

on_worker_boot do
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end
plugin :tmp_restart