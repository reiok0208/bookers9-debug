class ThanksMailer < ApplicationMailer
  default :from => ENV['GOOGLE_MAIL_NAME']

    def send_signup_email(user)
        @user = user
        mail( :to => @user.email, :subject => "会員登録が完了しました。" )
    end
end
