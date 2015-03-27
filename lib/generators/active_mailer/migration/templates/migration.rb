class <%= migration_class_name %> < ActiveRecord::Migration
  def change
    create_active_mailer_table :<%= table_name %> do |t|
<% attributes.each do |attribute| -%>
      t.<%= attribute.type %> :<%= attribute.name %><%= attribute.inject_options %>
<% end -%>

      t.integer   :sender_id
      t.timestamp :sent_at
      t.string    :subject

      t.timestamps
    end
<% attributes_with_index.each do |attribute| -%>
    add_index :<%= table_name %>, :<%= attribute.index_name %><%= attribute.inject_index_options %>
<% end -%>
  end
end
