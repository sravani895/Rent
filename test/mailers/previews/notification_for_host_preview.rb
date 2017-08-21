# Preview all emails at http://localhost:3000/rails/mailers/notification_for_host
class NotificationForHostPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notification_for_host/authorized_confirmation
  def authorized_confirmation
    NotificationForHost.authorized_confirmation
  end

end
