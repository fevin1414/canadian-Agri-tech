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
      # Save the uploaded images
      params[:images]&.each do |image_file|
        @product.images.create(filename: image_file.original_filename, file_path: image_file.tempfile.path)
      end

      redirect_to admin_dashboard_path, success: 'Product created successfully.'
    else
      render :new
    end
  end
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      # Save the uploaded images
      params[:images]&.each do |image_file|
        @product.images.create(file: image_file)
      end
      redirect_to admin_product_path(@product), success: 'Product updated successfully.'
    else
      render :edit
    end
  end


  def edit
    @product = Product.find(params[:id])
    @categories = Category.all
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
    params.require(:product).permit(:name, :description, :price, :category_id, images: [])
  end



end
