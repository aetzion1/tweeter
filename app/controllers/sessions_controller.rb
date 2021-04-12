class SessionsController < ApplicationController
  skip_before_action :authorize_access
  
  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      reset_session
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.username}"
      redirect_to dashboard_path
    else
      flash[:error] = 'Please check your credentials and try again!'
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'Log Out Successful'
  end
end
