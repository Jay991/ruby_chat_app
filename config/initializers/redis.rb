# config/initializers/redis.rb
if Rails.env.development? || Rails.env.production?
    redis_url = ENV['REDIS_URL'] || 'redis://localhost:6379/1'
    ActionCable.server.config.cable = { adapter: 'redis', url: redis_url }
  end
  