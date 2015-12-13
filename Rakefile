require 'bundler/setup'
require 'rake'
require 'rdoc/task'
require 'rake/testtask'
require 'bundler/gem_tasks'

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/*_test.rb'
  t.verbose = true
end

if !ENV["APPRAISAL_INITIALIZED"]
  task :default do
    system("appraisal rake")
  end
else
  task :default => :test
end

Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'ActiveMailer'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
