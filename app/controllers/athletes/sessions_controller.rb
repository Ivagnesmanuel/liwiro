# frozen_string_literal: true

class Athletes::SessionsController < Devise::SessionsController
  before_action :check
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # The path used after sign in
  def after_sign_in_path_for(resource)
    root_path
  end

  def check
    if (gym_signed_in?)
      flash[:notice] = "You are already signed in"
      redirect_to(root_path) && return
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
