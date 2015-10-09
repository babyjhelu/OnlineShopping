class HomeController < ApplicationController
  before_action :set_product, only: [:upvote, :downvote]

  before_action :authenticate_user!

  layout 'user_layout'

  respond_to :html

  def give_time
    @time = Time.now.utc.to_s.split(" ").second
    render :partial => 'shared/time_portion'
  end

  def index
    @home_categories = Category.all.where(:status => true)
    @banner_products = Product.all
  end

  def product_index
    
    @products = Product.all.where(:status => true, :category_id => params[:category])
    @paginate_products = Product.page(params[:page]).per(4)

  end

  def category_index

    @categories = Category.all.where(:status => true)
    @paginate_categories = Category.page(params[:page]).per(4)

  end

  def toggle_approve
    @products = Product.find(params[:id])
    @products.toggle!(:status)
    respond_to do |format|
      format.js
    end
  end

  def show
    @user = User.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      UserMailer.signup_confirmation(@user).deliver
      redirect_to @user, notice: "Signed up successfully"
    else
      render :new
    end
  end

  def upvote
    @product.upvote_from current_user
    redirect_to request.referrer
  end

  def downvote
    @product.downvote_from current_user
    redirect_to request.referrer
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:product_name, :available_sizes, :available_colors, :category_id , :image, :status)
  end

end
