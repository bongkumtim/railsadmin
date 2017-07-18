class UserMailer < ApplicationMailer
	default from: 'admin@melab.biz'
  	layout 'mailer'

    def send_welcome_email(user)
    @url = "http://www.melab.biz"
    @user = user
    mail(:to => @user.email, :subject => "Welcome!")
  end
end
