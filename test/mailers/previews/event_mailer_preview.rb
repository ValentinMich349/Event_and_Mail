# Preview all emails at http://localhost:3000/rails/mailers/event_mailer
class EventMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/event_mailer/new_attendance_notification
  def new_attendance_notification
    EventMailer.new_attendance_notification
  end

end
