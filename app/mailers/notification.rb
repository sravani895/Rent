class Notification < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.isauthorize_confirmation.subject
  #
  def isauthorize_confirmation
    
    
    mail to: "lakshmisravani597@gmail.com", subject: "new room is added which need to be authorized"
  end
  
 
end
