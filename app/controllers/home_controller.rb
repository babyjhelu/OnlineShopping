class HomeController < ApplicationController

  before_action :authenticate_user!

  layout 'admin_layout'

  def index

  end
end
