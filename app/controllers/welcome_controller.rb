class WelcomeController < ApplicationController
  skip_before_action :authorize_access
  
  def index
    redirect_to dashboard_path if current_user
  end
end
