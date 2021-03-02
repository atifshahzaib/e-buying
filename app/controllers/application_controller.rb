class ApplicationController < ActionController::Base
  helper_method :user_signed_in?, :current_user_admin?
  protect_from_forgery

  def user_signed_in?
    session[:user_id].present? ? true : false
  end

  def current_user_admin?
    user ||= User.find(session[:user_id]) if user_signed_in?
    user.present? && user.admin
  end
end
