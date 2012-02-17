class CreateActiveMailerTables < ActiveRecord::Migration
  def self.up
    create_table :email_users do |t|
      t.string :email_address
      t.timestamps
    end

    create_table :email_user_associations do |t|
      t.references :email_user
      t.string :emailable_type
      t.integer :emailable_id
      t.timestamps
    end
  end

  def self.down
    drop_table :email_users
    drop_table :email_user_associations
  end
end
