class SessionsController < ApplicationController
  def new
  end

  def create
    session_params = params[:session] || {}
    email = session_params[:email]
    password = session_params[:password]

    user = User.find_by(email: email)
    admin = Admin.find_by(email: email)

    if user && user.authenticate(password)
      log_in(user)
      redirect_to root_path
    elsif admin && admin.authenticate(password)
      log_in(admin)
      redirect_to admin_dashboard_path
    else
      flash.now[:error] = 'Invalid email/password combination'
      render :new
    end
  end
  def destroy
    reset_session
    redirect_to login_path, notice: "Logged out successfully."
  end

end
