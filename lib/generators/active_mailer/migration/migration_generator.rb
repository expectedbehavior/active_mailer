require 'rails/generators'
require 'rails/generators/migration'

module ActiveMailer
  class MigrationGenerator < Rails::Generators::NamedBase
    include Rails::Generators::Migration
    argument :attributes, :type => :array, :default => [], :banner => "field[:type][:index] field[:type][:index]"
    
    include Rails::Generators::Migration
    def self.source_root
      @source_root ||= File.join(File.dirname(__FILE__), 'templates')
    end
   
    def self.next_migration_number(dirname)
      if ActiveRecord::Base.timestamped_migrations
        Time.new.utc.strftime("%Y%m%d%H%M%S")
      else
        "%.3d" % (current_migration_number(dirname) + 1)
      end
    end
   
    def create_migration_file
      migration_template 'migration.rb', "db/migrate/create_#{table_name}.rb"
    end
    
    def attributes_with_index
      attributes.select { |a| a.has_index? || (a.reference? && options[:indexes]) }
    end
    
  end
end
