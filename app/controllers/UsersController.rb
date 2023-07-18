class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if User.exists?(email: @user.email) || User.exists?(name: @user.name)
      flash.now[:error] = "Username or email already exists. Please choose a different one."
      render :new
    elsif @user.save
      flash[:success] = "Signup successful! Please log in."
      redirect_to signin_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
