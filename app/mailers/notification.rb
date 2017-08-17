class Notification < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.isauthorize_confirmation.subject
  #
  def isauthorize_confirmation(room)
    @room = room
    users = User.where('role_id=1', true).pluck(:email).join(",")
    mail to: "#{room.user.email}", cc: "#{users}", subject: "Your order has been confirmed - #{order.order_number}"
  end
  
 end

end
