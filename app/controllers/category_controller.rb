class CategoryController < ApplicationController

  before_action :authenticate_user!

  layout 'user_layout'

  respond_to :html

  def index
    @categories = Category.all
    respond_with(@categories)
  end

end
