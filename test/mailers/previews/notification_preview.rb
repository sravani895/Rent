# Preview all emails at http://localhost:3000/rails/mailers/notification
class NotificationPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notification/isauthorize_confirmation
  def isauthorize_confirmation
    Notification.isauthorize_confirmation
  end

end
