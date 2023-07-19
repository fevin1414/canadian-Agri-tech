class Admin::ProductsController < ApplicationController
  def new
    @product = Product.new
    @categories = Category.all
  end
  def show
    @product = Product.find(params[:id])
  end
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_dashboard_path, success: 'Product created successfully.'
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_dashboard_path, success: 'Product updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_dashboard_path, success: 'Product deleted successfully.'
  end

  def index
    redirect_to admin_dashboard_path
  end


  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :category_id)
  end
end
