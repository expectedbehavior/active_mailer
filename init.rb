# # Include hook code here
# module ActiveRecord
#   module ConnectionAdapters
#     module SchemaStatements
#       def create_active_mailer_table(*args, &block)
#         block_with_default_columns = Proc.new do |t|
#           t.integer   :sender_id
#           t.timestamp :sent_at
#           t.string    :subject
#           block.call(t)
#         end
        
#         create_table(*args, &block_with_default_columns)
        
#       end
#     end
#   end
# end

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
