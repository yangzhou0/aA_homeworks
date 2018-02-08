class UserMailer < ApplicationMailer
  default from: 'Yang Zhou <yzhou3991@gmail.com>'

  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000/session/new'
    mail(to: @user.email, subject: 'Thanks for signing up!')
  end

end
