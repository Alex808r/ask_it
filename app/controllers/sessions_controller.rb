class SessionsController < ApplicationController
  before_action :require_no_authentication, only: %i[new create]
  before_action :require_authentication, only: :destroy

  def new
  end

  def create
    #render plain: params.to_yaml
    user =User.find_by email: params[:email]
    if user&.authenticate(params[:password])
      # session[:user_id] = user.id вынесли в concerns authenticate.rb заменили на sign_in
      sign_in user
      flash[:success] = "Welcome back, #{current_user.name_or_email}"
      redirect_to root_path
    else
      flash[:warning] = "Incorrect email and/or password!"
      render :new
    end
  end

  def destroy
    sign_out
    flash[:success] = "See you later!"
    redirect_to root_path
  end


end