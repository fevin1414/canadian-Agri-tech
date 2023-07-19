class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
    @categories = Category.all
    render 'index' # Render the index.html.erb view
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_dashboard_path, notice: 'Category successfully created.'
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if category_params[:name] != @category.name && Category.exists?(name: category_params[:name])
      redirect_to edit_admin_category_path(@category), alert: 'Category name already exists.'
    elsif @category.update(category_params)
      redirect_to admin_categories_path, notice: 'Category successfully updated.'
    else
      render :edit
    end
  end
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_categories_path, notice: 'Category successfully deleted.'
  end


  private

  def category_params
    params.require(:category).permit(:name)
  end
end
