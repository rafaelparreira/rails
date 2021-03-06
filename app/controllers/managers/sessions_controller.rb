# frozen_string_literal: true

class Managers::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  skip_authorize_resource  :only  =>  :destroy 

  # GET /resource/sign_in
  #def new
  #  super
  #  format.html { redirect_to '/expenses'}
  #end

  # POST /resource/sign_in
  #def create
  #  super
  #  format.html { redirect_to '/expenses'}
  #end

  # DELETE /resource/sign_out
  #def destroy
  #  super
  #end

  #protected

  # If you have extra params to permit, append them to the sanitizer.
  #def configure_sign_in_params
  #  devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  #end
end
