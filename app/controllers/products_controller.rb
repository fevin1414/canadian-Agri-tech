class ProductsController < ApplicationController
  def index
    @categories = Category.all

    # Check if a category is selected in the dropdown
    if params[:category_id].present?
      @category = Category.find(params[:category_id])
      @products = @category.products
    else
      @products = Product.all
    end

    # Check if a keyword is provided for search
    if params[:keyword].present?
      keyword = "%#{params[:keyword].downcase}%"
      @products = @products.where("lower(name) LIKE ? OR lower(description) LIKE ?", keyword, keyword)
    end

    @products = @products.page(params[:page]).per(5)
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
