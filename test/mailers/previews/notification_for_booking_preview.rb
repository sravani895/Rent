# Preview all emails at http://localhost:3000/rails/mailers/notification_for_booking
class NotificationForBookingPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notification_for_booking/is_confirmed_confirmation
  def is_confirmed_confirmation
    NotificationForBooking.is_confirmed_confirmation
  end

end
