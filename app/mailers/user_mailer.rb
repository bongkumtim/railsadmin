class UserMailer < ApplicationMailer
	default from: 'admin@melab.biz'
  	layout 'mailer'

    def send_welcome_email(user)
    @user = user
    mail(:to => @user.email, :subject => "Welcome!")
  end
end
