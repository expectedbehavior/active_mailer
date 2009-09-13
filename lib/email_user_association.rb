class EmailUserAssociation < ActiveRecord::Base
  belongs_to :email_user
  belongs_to :emailable, :polymorphic => true
end
