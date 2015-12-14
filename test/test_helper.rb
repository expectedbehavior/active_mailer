# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"

require "rails/all"

$: << File.join(File.dirname(__FILE__), "lib")
require "active_mailer"

require File.expand_path("../fixtures/dummy/application.rb",  __FILE__)
require "rails/test_help"

require "wrong"
require "pry"

# ActionMailer::Base.delivery_method = :test
# ActionMailer::Base.perform_deliveries = true
# ActionMailer::Base.default_url_options[:host] = "test.com"

# Rails.backtrace_cleaner.remove_silencers!

puts "Running tests against Rails #{Rails::VERSION::STRING}"

# Run any available migration
Dummy::Application.initialize!

ActiveRecord::Migrator.migrate File.expand_path("../fixtures/dummy/db/migrate/", __FILE__)

# Load support files
# Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }
