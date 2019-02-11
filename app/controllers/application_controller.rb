class ApplicationController < ActionController::Base

  helper_method :require_login, :current_user

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

  def current_user
    session[:user_id]
  end

end
