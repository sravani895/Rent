require 'test_helper'

class NotificationTest < ActionMailer::TestCase
  test "isauthorize_confirmation" do
    mail = Notification.isauthorize_confirmation
    assert_equal "Isauthorize confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
