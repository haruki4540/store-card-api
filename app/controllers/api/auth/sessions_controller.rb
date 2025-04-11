# app/controllers/api/auth/sessions_controller.rb
module Api
  module Auth
    class SessionsController < ApplicationController

      def create
        user = User.find_by(email: params[:email])

        if user && user.authenticate(params[:password])
          render json: { 
            token: "dummy-jwt-token", 
            user: { 
              name: user.name, 
              email: user.email,
              user_type: user.user_type,
              unique_code: user.unique_code,
              phone_number: user.phone_number,
              two_factor_enabled: user.two_factor_enabled,
              coupon_balance: user.coupon_balance,
              membership_number: user.membership_number
            } 
          }, status: :ok
        else
          render json: { error: "Invalid email or password" }, status: :unauthorized
        end
      end
    end
  end
end
