# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_current_user, only: [:create]
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン後のリダイレクト先
  def after_sing_in_path_for(_resource)
    friends_path
    blogs_path
  end

  def set_current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name image])

    devise_parameter_sanitizer.permit(:account_update, keys: %i[name email profile image strength clan psnid twitter])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[sex level lightlevel model voice style timezone profession])
  end
end
