require_relative './test_helper'

class ActiveMailerTest < ActiveSupport::TestCase
  test "removes nil from recipients list automatically" do
    email = nil
    assert_nothing_raised { email = InvitationEmail.new(:sender => "spammy@example.com", :recipients => ["takesit@upemail.com", nil]) }
    assert email.save
    assert 1, email.recipients.length
  end
end
