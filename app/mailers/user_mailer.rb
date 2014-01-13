class UserMailer < ActionMailer::Base
  default from: 'Sprout <sprout@sprout.icelle.com>'

  def welcome_email(user)
    @user = user
    @url  = 'http://sprout.icelle.com/login'
    mail(to: "#{@user.first_name} #{@user.last_name} <#{@user.email}>", subject: 'Welcome to Sprout!')
  end
end
