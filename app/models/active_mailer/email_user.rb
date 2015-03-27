module ActiveMailer
  class EmailUser < ActiveRecord::Base
    include  ActiveModel::MassAssignmentSecurity
    attr_accessible :email_address

    has_many :email_user_associations
    has_many :emailables, :through => :email_user_associations
  end
end
