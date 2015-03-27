module ActiveMailer
  class EmailUserAssociation < ActiveRecord::Base
    include  ActiveModel::MassAssignmentSecurity
    attr_accessible :email_user_id

    belongs_to :email_user
    belongs_to :emailable, :polymorphic => true
  end
end
