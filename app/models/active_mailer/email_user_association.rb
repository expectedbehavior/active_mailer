module ActiveMailer
  class EmailUserAssociation < ActiveRecord::Base
    belongs_to :email_user
    belongs_to :emailable, :polymorphic => true, :optional => true
  end
end
