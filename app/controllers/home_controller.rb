class HomeController < ApplicationController
  def index
    @categories = Category.all
    # Add any other logic you have in the index action
  end
end
