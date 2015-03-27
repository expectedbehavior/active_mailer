module ActiveMailer
  class EmailUser < ActiveRecord::Base
    has_many :email_user_associations
    has_many :emailables, :through => :email_user_associations
  end
end
