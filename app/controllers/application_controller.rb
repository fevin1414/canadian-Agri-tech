class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user

  # Check if a user is currently logged in
  def logged_in?
    !session[:user_id].nil?
  end

  # Get the currently logged-in user
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if logged_in?
  end

  private

  def log_in(user)
    session[:user_id] = user.id
  end
end
