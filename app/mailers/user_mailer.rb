class UserMailer < ActionMailer::Base
  default from: 'icelleku@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://sprout.icelle.com/login'
    mail(to: @user.email, subject: 'Account Confirmation. Welcome to Sprout.')
  end
end
