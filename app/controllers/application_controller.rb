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

  # Log in a user
  def log_in(user)
    session[:user_id] = user.id
  end

  # Log out a user
  def destroy
    reset_session
    redirect_to login_path, notice: "Logged out successfully."
  end
end
