class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV["HTTP_BASIC_AUTH_USER"].to_s, password: ENV["HTTP_BASIC_AUTH_PASSWORD"].to_s

  def index
    @categories = Category.order(id: :desc).all
    
  end

  def new 
  end

  def create
  end
end
