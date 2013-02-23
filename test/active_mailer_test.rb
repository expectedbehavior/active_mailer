require_relative './test_helper'

class ActiveMailerTest < ActiveSupport::TestCase
  include Wrong
  test "removes nil from recipients list automatically" do
    email = nil
    assert_nothing_raised do
      email = InvitationEmail.new(:sender => "spammy@example.com", 
                                  :recipients => ["takesit@upemail.com", nil],
                                  :subject => "YOU GUYS!"
                                  )
    end
    assert { email.save }
    deny   { email.recipients.length == 2 }
  end
  
  test "sends with correct subject" do
    email = InvitationEmail.new(:sender => "spammy@example.com", 
                                :recipients => ["takesit@upemail.com", nil],
                                :subject => "YOU GUYS!"
                                )
    assert { email.send! }
    assert { email.mailer.subject == email.subject }
  end
end
