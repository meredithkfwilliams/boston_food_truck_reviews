class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :devise_permitted_parameters, if: :devise_controller?

  def authorize_user!
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end

  protected
  def devise_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(
        :email, :password,
        :password_confirmation, :avatar, :avatar_cache
      )
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(
        :email, :password,
        :password_confirmation, :current_password,
        :avatar, :avatar_cache, :remove_avatar
      )
    end
  end
end
