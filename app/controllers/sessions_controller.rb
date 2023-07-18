class SessionsController < ApplicationController
  def new
  end

  def create
    session_params = params[:session] || {}

    user = User.find_by(email: session_params[:email])

    if user && user.authenticate(session_params[:password])
      log_in(user)
      redirect_to root_path
    else
      flash.now[:error] = 'Invalid email/password combination'
      render :new
    end
  end
end
