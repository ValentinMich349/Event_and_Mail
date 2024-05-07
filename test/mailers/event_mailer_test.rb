require "test_helper"

class EventMailerTest < ActionMailer::TestCase
  test "new_attendance_notification" do
    mail = EventMailer.new_attendance_notification
    assert_equal "New attendance notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
