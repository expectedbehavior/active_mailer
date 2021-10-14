# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"

require "rails/all"

$: << File.join(File.dirname(__FILE__), "lib")
require "active_mailer"


# Appraisal names the generated Gemfile according to the name you
# provide in the Appraisals file. We use the name of the appraisal to
# load the correct Rails application for testing the current
# Appraisal. For example, if the Appraisals file contains
#
#   appraise 'rails_5.1.7' do
#     gem 'rails', '~> 5.1.7'
#     gem 'sqlite3', '~> 1.4.2'
#   end
#
# then we expect Appraisal to generate gemfiles/rails_5.1.7.gemfile.
appraisal_name = ENV['BUNDLE_GEMFILE'].split("/").last.chomp(".gemfile")

# Load the Rails test project that matches the appraisal name. If the
# appraisal is named 'rails_5.1.7' there should be a
# fixtures/rails_5.1.7 directory containing a valid Rails project for
# testing.
require File.expand_path("../fixtures/#{appraisal_name}/application.rb",  __FILE__)
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
