class NotifcationForUser < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifcation_for_user.is_confirmed.subject
  #
  def is_confirmed(booking)
   @booking = booking
   user = @booking.user.email
     mail to: "#{user}", subject: "your booking is confirmed booking = #{booking.id}"
  end
end
