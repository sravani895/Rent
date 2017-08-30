# Preview all emails at http://localhost:3000/rails/mailers/notifcation_for_user
class NotifcationForUserPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notifcation_for_user/is_confirmed
  def is_confirmed
    NotifcationForUser.is_confirmed
  end

end
