class UsersController < ApplicationController
  skip_before_action :authorize_access

  def new
    @user = User.new
  end

  def create
    new_user = User.new(user_params)
    if new_user.save
      session[:user_id] = new_user.id
      flash[:success] = "Welcome, #{current_user.username}"
      redirect_to dashboard_path
    else
      flash[:error] = 'Your credentials need some work, my friend!'
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params[:user][:email] = params[:user][:email].downcase
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
end
