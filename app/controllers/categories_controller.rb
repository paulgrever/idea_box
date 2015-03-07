class CategoriesController < ApplicationController
  before_action :set_category, only: [:update, :show, :edit, :destroy]
  
  
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new(theme: params[:theme])
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

  private 

  def set_category
    @cateogry = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:theme)
  end
end
