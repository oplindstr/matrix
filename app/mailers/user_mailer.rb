class UserMailer < ApplicationMailer
  default from: 'members@matrix.fi'

  def recover_username(user)
    @username = user.username

    mail(to: user.email, from: 'members@matrix.fi', subject: 'Käyttäjätunnuksen palautus')
  end

  def recover_password(user, password)
    @password = password

    mail(to: user.email, from: 'members@matrix.fi', subject: 'Salasanan palautus')
  end
end
