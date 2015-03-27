# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../fixtures/dummyapp_rails_3.2/config/environment.rb",  __FILE__)
require "rails/test_help"

require "wrong"

# ActionMailer::Base.delivery_method = :test
# ActionMailer::Base.perform_deliveries = true
# ActionMailer::Base.default_url_options[:host] = "test.com"

# Rails.backtrace_cleaner.remove_silencers!

# Run any available migration
ActiveRecord::Migrator.migrate File.expand_path("../fixtures/dummyapp_rails_3.2/db/migrate/", __FILE__)

# Load support files
# Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }


