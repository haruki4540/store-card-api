# app/controllers/api/application_controller.rb
module Api
  class ApplicationController < ActionController::API
    before_action :underscore_params!

    private

    def underscore_params!
      params.deep_transform_keys!(&:underscore)
    end
  end
end
