module ActiveMailer
  class EmailUserAssociation < ActiveRecord::Base
    attr_accessible :email_user_id
    
    belongs_to :email_user
    belongs_to :emailable, :polymorphic => true
  end
end
