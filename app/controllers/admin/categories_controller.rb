class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV["HTTP_BASIC_AUTH_USER"].to_s, password: ENV["HTTP_BASIC_AUTH_PASSWORD"].to_s

  def index
    @categories = Category.order(id: :desc).all
  end

  def new 
    @category = Category.new
  end

  def create
    @category = Category.new(params.require(:category).permit(:name))
    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end
end
