class UserMailer < ApplicationMailer
    default from: 'moonbloom.ent.tokyo@gmail.com'
  
    def confirm_email(user)
      @user = user
      @url = "https://3c73-150-249-113-231.ngrok-free.app/api/auth/confirm?token=#{@user.email_confirm_token}"
  
      mail(to: @user.email, subject: '【重要】メールアドレスの確認をお願いします') do |format|
        format.html
        format.text
      end
    end
  end
  