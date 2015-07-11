class CategoryController < ApplicationController

  before_action :authenticate_user!

  layout 'user_layout'

  respond_to :html

  def index
    @category = Category.all
    respond_with(@category)
  end

end
