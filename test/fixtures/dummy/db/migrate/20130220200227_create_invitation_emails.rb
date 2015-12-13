class CreateInvitationEmails < ActiveRecord::Migration
  def change
    create_active_mailer_table :invitation_emails do |t|
      t.integer :invitation_id
      t.timestamps
    end
  end
end
