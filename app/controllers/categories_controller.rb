class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!

  respond_to :html
  layout 'admin_layout'
  def index
    @categories = Category.all
    respond_with(@categories)
  end

  def show
    respond_with(@category)
  end

  def new
    @category = Category.new
    respond_with(@category)
  end

  def edit

  end

  def create
    @category = Category.new(category_params)
    @category.save
    redirect_to categories_path
    flash[:notice] = "Category Successfully Created"
  end

  def update
    @category.update(category_params)
    redirect_to categories_path
    flash[:notice] = "Category Successfully Updated"
  end

  def destroy
    @category.destroy
    respond_with(@category)
    flash[:notice] = "Category Successfully Destroyed"
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:category_name, :description, :image, :status)
    end
end
