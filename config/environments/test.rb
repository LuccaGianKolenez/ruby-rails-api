Rails.application.configure do
  config.eager_load = false
  config.cache_classes = true
  config.action_controller.allow_forgery_protection = false
  config.log_level = :warn
end
