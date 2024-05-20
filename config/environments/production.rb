Rails.application.configure do
  config.consider_all_requests_local = true
  config.action_controller.perform_caching = true
  config.cache_classes = true
  config.eager_load = true

  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.assets.compile = false
  config.active_storage.service = :local

  config.log_level = :debug
  config.log_tags = [:request_id]
  config.action_mailer.perform_caching = false
  config.i18n.fallbacks = true
  config.active_support.report_deprecations = false
  config.log_formatter = ::Logger::Formatter.new

  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger = ActiveSupport::TaggedLogging.new(logger)
  end

  config.active_record.dump_schema_after_migration = false

  # Action Cable configuration
  config.action_cable.url = 'wss://ruby.gadflytech.com/cable'
  config.action_cable.allowed_request_origins = ['https://ruby.gadflytech.com', 'http://ruby.gadflytech.com']

  config.action_mailer.default_url_options = { host: 'ruby.gadflytech.com', protocol: 'https' }
  config.hosts << "ruby.gadflytech.com"
  config.hosts << "64.23.176.239"
end
