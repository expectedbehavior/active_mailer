class InvitationEmail < ActiveMailer::Base
  include  ActiveModel::MassAssignmentSecurity
  attr_accessible :subject, :sender, :recipients

  def after_initialize
    self.subject = "You've been invited!"
  end
end
