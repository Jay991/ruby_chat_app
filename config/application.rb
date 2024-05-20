require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

Dotenv::Railtie.load if %w[development test production].include? ENV['RAILS_ENV']

module ChatApp
  class Application < Rails::Application
    config.load_defaults 7.0

  end
end
