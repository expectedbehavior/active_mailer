# This is a minimal Rails application with Rails 3 and 4 compatibility.
#
# copied with modifications from https://github.com/thoughtbot/clearance/blob/master/spec/dummy/application.rb
require "rails/all"

module Dummy
  APP_ROOT = File.expand_path("..", __FILE__).freeze

  I18n.enforce_available_locales = true

  class Application < Rails::Application
    config.action_controller.allow_forgery_protection = false
    config.action_controller.perform_caching = false
    config.action_dispatch.show_exceptions = false
    config.action_mailer.default_url_options = { host: "dummy.example.com" }
    config.action_mailer.delivery_method = :test
    config.active_support.deprecation = :stderr
    config.active_support.test_order = :random
    config.assets.enabled = true
    config.cache_classes = true
    config.consider_all_requests_local = true
    config.eager_load = false
    config.encoding = "utf-8"
    config.paths["app/controllers"] << "#{APP_ROOT}/app/controllers"
    config.paths["app/models"] << "#{APP_ROOT}/app/models"
    config.paths["app/views"] << "#{APP_ROOT}/app/views"
    config.paths["config/database"] = "#{APP_ROOT}/config/database.yml"
    config.paths["db"] = "#{APP_ROOT}/db"
    config.paths["db/migrate"] = "#{APP_ROOT}/db/migrate"
    config.paths["log"] = "tmp/log/development.log"
    config.secret_token = "SECRET_TOKEN_IS_MIN_30_CHARS_LONG"

    if Rails::VERSION::MAJOR >= 4
      config.secret_key_base = "SECRET_KEY_BASE"
    end

    def require_environment!
      initialize!
    end

    def initialize!(&block)
      FileUtils.mkdir_p(Rails.root.join("db").to_s)
      super unless @initialized
    end
  end
end
