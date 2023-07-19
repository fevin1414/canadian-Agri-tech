class Admin::DashboardController < ApplicationController
  def index
    @users = User.all
    @categories = Category.all
    @admins = Admin.all
    @products = Product.all
  end

  def new
    @admin = Admin.new
  end

  def users
    @users = User.all
  end

  def new_product
    @product = Product.new
  end

  def show_user
    @user = User.find(params[:id])
  end

  def remove_user
    user = User.find(params[:id])
    user.destroy
    redirect_to admin_users_path, notice: 'User successfully removed.'
  end

  def categories
    @categories = Category.all
  end

  def new_category
    @category = Category.new
  end

  def create_category
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path, notice: 'Category successfully created.'
    else
      render :new_category
    end
  end

  def edit_category
    @category = Category.find(params[:id])
  end

  def update_category
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to admin_categories_path, notice: 'Category successfully updated.'
    else
      render :edit_category
    end
  end


  private

  def category_params
    params.require(:category).permit(:name)
  end
end

# Move the route definition outside the action definition

