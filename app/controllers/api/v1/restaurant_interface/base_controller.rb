class Api::V1::RestaurantInterface::BaseController < ApplicationController
    protect_from_forgery with: :null_session
    include DeviseTokenAuth::Concerns::SetUserByToken
    respond_to :json
    def destroy_session
      request.session_options[:skip] = true
    end
end
