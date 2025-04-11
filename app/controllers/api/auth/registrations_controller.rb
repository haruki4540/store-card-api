# app/controllers/api/auth/registrations_controller.rb
class Api::Auth::RegistrationsController < Api::ApplicationController
  
    # POST /api/auth/register
    def create
      user = User.new(user_params)
  
      if user.save
        # 保存に成功したら、確認メールを非同期で送信
        UserMailer.confirm_email(user).deliver_later
        render json: { message: '確認メールを送信しました。メールをご確認ください。' }, status: :created
      else
        render json: { message: '登録に失敗しました。', errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # GET /api/auth/confirm?token=xxxxxx
    def confirm
      user = User.find_by(email_confirm_token: params[:token])
      if user && user.confirmed_at.nil?
        user.update(confirmed_at: Time.current, email_confirm_token: nil)
        render json: { message: 'メール認証が完了しました。' }, status: :ok
      else
        render json: { message: 'トークンが無効または既に認証済みです。' }, status: :unprocessable_entity
      end
    end
  
    private
  
    def user_params
      # フロント側から受け取るパラメータを許可する
      params.require(:user).permit(:name, :furigana, :birth_date, :phone_number, :gender, :email, :password, :membership_number)
    end
  end
