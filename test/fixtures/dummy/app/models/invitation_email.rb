class InvitationEmail < ActiveMailer::Base
  def after_initialize
    self.subject = "You've been invited!"
  end
end
