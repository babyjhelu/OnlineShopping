class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!
  layout 'admin_layout'

  respond_to :html

  def index
    @category = Category.find(params[:category])
    @products = Product.all.where(:category_id => params[:category])

  end

  def show
    respond_with(@product)

  end

  def new
    @category = Category.find(params[:category])
    @product = Product.new
    respond_with(@product)
  end

  def edit
    @category = Category.find(params[:category])
  end

  def toggle_approve
    @products = Product.find(params[:id])
    @products.toggle!(:status)
    respond_to do |format|
      format.js
    end
  end

  def upvote
    @link = Link.find(params[:id])
    @link.upvote_by current_user
    redirect_to links_path
  end

  def create
    @product = Product.new(product_params)
    @product.save
    respond_to do |format|
    format.html { redirect_to products_path(:category => @category.id), notice: 'Product was successfully created.' }
  end
  end

  def update
    @product.update(product_params)
    respond_to do |format|
      format.html { redirect_to products_path(:category => @category.id), notice: 'Product was successfully updated.' }
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_path(:category => @category.id), notice: 'Product was successfully destroyed.' }
    end
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:product_name, :available_sizes, :available_colors, :category_id , :image, :status)
    end
end
