class Admin::AdminsController < ApplicationController
  def index
    @admins = Admin.all
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      redirect_to admin_admins_path, notice: "Admin successfully created."
    else
      render :new
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:name, :email, :password)
  end
end
