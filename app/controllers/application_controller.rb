class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper :all # include all helpers, all the time

  protect_from_forgery with: :exception

  before_filter :set_p3p

  private

  def set_p3p
    headers['P3P'] = 'CP="ALL DSP COR CURa ADMa DEVa OUR IND COM NAV"'
  end


  def after_sign_in_path_for(resource)
    stored_location_for(resource) ||
        if resource.is_a?(Admin)
          categories_path
        else
          root_path
        end
  end

  def after_sign_out_path_for(resource)
    request.referrer
  end

  def after_sign_up_path_for(resource)
    request.referrer
    redirect_to new_user_registration_path
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

end