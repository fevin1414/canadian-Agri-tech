class Admin::AdminsController < ApplicationController
  def new
    @admin = Admin.new
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.password == @admin.password_confirmation
      if @admin.save
        redirect_to admin_dashboard_path, notice: 'Admin successfully created.'
      else
        render :new
      end
    else
      @admin.errors.add(:password_confirmation, "doesn't match Password")
      render :new
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:name, :email, :password, :password_confirmation)
  end
end
