class HomeController < ApplicationController

  before_action :authenticate_user!

  layout 'user_layout'

  respond_to :html

  def index
    @products = Product.all
    respond_with(@products)
  end

end
