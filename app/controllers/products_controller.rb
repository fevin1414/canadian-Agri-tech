

class ProductsController < ApplicationController
  def index
    @categories = Category.all
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @categories = Category.all
  end

  def products_by_category
    @category = Category.find(params[:id])
    @products = @category.products
    @categories = Category.all
    render 'products/categories' # This will render the categories.html.erb template
  end
end
