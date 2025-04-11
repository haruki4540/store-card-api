# app/controllers/api/auth/confirmations_controller.rb

module Api
  module Auth
    class ConfirmationsController < ApplicationController
      def confirm
        user = User.find_by(email_confirm_token: params[:token])

        if user.present?
          user.confirm!
          render json: { message: 'メールアドレスが確認されました。' }, status: :ok
        else
          render json: { error: '無効な確認リンクです。' }, status: :unprocessable_entity
        end
      end
    end
  end
end
