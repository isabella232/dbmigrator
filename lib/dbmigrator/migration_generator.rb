require 'rails/generators'
require 'rails/generators/active_record/migration/migration_generator'

class SqlMigrationGenerator < ActiveRecord::Generators::MigrationGenerator
  class_option :location, :type => :string, :default => "db/migrate"

  def create_migration_file
    set_local_assigns!
    validate_file_name!
    migration_name = "#{file_name}.rb"
    migration_template "migration.rb", File.join(options[:location], migration_name)
  end

  def source_paths
    [File.join(File.dirname(__FILE__), "templates")]
  end
  protected
    def validate_file_name!
      unless file_name =~ /^[_a-z0-9]+$/
        raise IllegalMigrationNameError.new(file_name)
      end
    end
end
