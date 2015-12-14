require "active_support/dependencies"

module ActiveMailer
  # Our host application root path
  # We set this when the engine is initialized
  mattr_accessor :app_root

  # Yield self on setup for nice config blocks
  def self.setup
    yield self
  end
end

require "active_mailer/engine"

ActiveRecord::ConnectionAdapters::SchemaStatements.module_eval do
  def create_active_mailer_table(*args, &block)
    block_with_default_columns = Proc.new do |t|
      t.integer   :sender_id
      t.timestamp :sent_at
      t.string    :subject
      block.call(t)
    end

    create_table(*args, &block_with_default_columns)
  end
end
