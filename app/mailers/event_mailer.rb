class EventMailer < ApplicationMailer
    def new_attendance_notification(attendance)
      @attendance = attendance
      @event = attendance.event
      @user = attendance.user
  
      mail(to: @event.admin.email, subject: 'Nouvelle inscription à votre événement')
    end
  end
  