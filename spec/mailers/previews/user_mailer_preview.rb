# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/recover_username
  def recover_username
    UserMailer.recover_username
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/recover_password
  def recover_password
    UserMailer.recover_password
  end

end
