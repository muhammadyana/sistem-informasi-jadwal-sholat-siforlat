# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  layout "layouts/authentication"
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    if verify_recaptcha
      super
    else
      flash[:alert] = "Recaptcha cannot be blank; or you are not human"
      redirect_to new_user_session_path
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
