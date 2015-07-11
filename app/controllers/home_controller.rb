class HomeController < ApplicationController

  before_action :authenticate_user!

  layout 'user_layout'

  respond_to :html

  def index


  end

  def product_index

    @products = Product.all.where(:category_id => params[:category])

  end

  def category_index

    @categories = Category.all.where(:status=> true)

  end

end
