# app/controllers/api/guests_controller.rb（例）
module Api
    class GuestsController < ApplicationController
      skip_before_action :verify_authenticity_token
  
      def register_guest
        # ローカルで生成されたゲストIDを元にゲストユーザーをDBに登録
        guest_id = params[:guest_id]
        # ここで guest_id を使ってユーザーを作成。必要な項目だけを入れる
        guest = User.create!(
          user_type: "guest",
          membership_number: generate_membership_number,  # 任意の会員番号生成ロジック
          guest_id: guest_id,
          last_updated: Time.current,
          # その他、必要ならデフォルト値を設定
        )
        render json: { status: "success", user: guest }, status: :ok
      end
  
      private
  
      def generate_membership_number
        SecureRandom.hex(4)
      end
    end
  end
  