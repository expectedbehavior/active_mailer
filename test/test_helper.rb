# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"

require "rails/all"

$: << File.join(File.dirname(__FILE__), "lib")
require "active_mailer"


# This is a very dumb way of getting the current Rails version
# appraisal is running out of the name of the bundle gemfile. If you
# start using a different naming scheme for the gemfiles, this will
# fall apart.
appraisal_version = ENV['BUNDLE_GEMFILE'].split("/").last.split("rails").last.split(".gemfile")

# require File.expand_path("../fixtures/rails-#{appraisal_version}/application.rb",  __FILE__)
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
