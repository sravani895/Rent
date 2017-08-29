class NotificationForBooking < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_for_booking.is_confirmed_confirmation.subject
  #
  def is_confirmed_confirmation(booking)
    @booking = booking
    user = @booking.room.user.email
    mail to: "#{user}", subject: "your room is booked which need to be confirmed booking = #{booking.id}"
  end
end
