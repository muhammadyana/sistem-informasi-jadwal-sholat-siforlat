# encoding: utf-8

module Api
  module V1
    class SessionsController < DeviseTokenAuth::SessionsController
      protect_from_forgery with: :null_session
      include Api::Concerns::ActAsApiRequest

      def resource_params
        params.permit(:email, :password)
      end

      private

      def render_create_success
        # TODO AMS not support withh devise_token_auth, this is i found from github, and it not usually use by AMS 
        render json: UserSerializer.new(@resource).as_json
        # render json: {
        #   status: "success",
        #   user: resource_data(
        #     resource_json: ActiveModel::UserSerializer.new(@resource).as_json
        #   )
        # }
      end
    end
  end
end
