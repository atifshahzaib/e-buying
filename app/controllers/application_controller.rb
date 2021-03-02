class ApplicationController < ActionController::Base
  helper_method :user_signed_in?
  protect_from_forgery

  def user_signed_in?
    session[:user_id].present? ? true : false
  end
end
