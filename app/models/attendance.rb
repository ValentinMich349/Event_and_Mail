class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event
  after_create :send_notification_email

  private

  def send_notification_email
    EventMailer.new_attendance_notification(self).deliver_now
  end
end
