require 'pry'
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :require_login, only: [:show]
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name, :user_type])
  end

  def after_sign_in_path_for(_resource)
    user_path(current_user.id)
  end

  def require_login
    unless current_user
      redirect_to login_index_path
    end
  end
end
