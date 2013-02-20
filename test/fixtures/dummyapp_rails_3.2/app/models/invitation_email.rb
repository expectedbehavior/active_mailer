class InvitationEmail < ActiveMailer::Base
  attr_accessible :subject, :sender, :recipients
  
  def after_initialize
    self.subject = "You've been invited!"
  end
end
