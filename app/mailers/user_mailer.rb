class UserMailer < ActionMailer::Base
  default :from => "highfivetuesdays@happygastropod.com"

  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Highfive Tuesdays: Password Reset"
  end
end
