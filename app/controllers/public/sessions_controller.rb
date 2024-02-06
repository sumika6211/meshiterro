# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :configure_sign_in_params, only: [:create]

  def after_sign_in_path_for(resource)
    post_images_path
  end

  def after_sign_out_path_for(resource)
    about_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end