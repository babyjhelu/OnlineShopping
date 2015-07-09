class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!
  layout 'admin_layout'

  before_action :set_product, only: [:show, :index]
  before_action :authenticate_user!
  layout 'user_layout'

  respond_to :html

  def index
    @products = Product.all
    respond_with(@products)
  end

  def show
    respond_with(@product)

  end

  def new
    @product = Product.new
    respond_with(@product)
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to products_path
    flash[:notice] = "Product Successfully Created"
  end

  def update
    @product.update(product_params)
    redirect_to products_path
    flash[:notice] = "Product Successfully Updated"
  end

  def destroy
    @product.destroy
    respond_with(@product)
    flash[:notice] = "Product Successfully Destroyed"
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:product_name, :available_sizes, :available_colors, :category_id , :image)
    end
end
