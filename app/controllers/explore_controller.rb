class ExploreController < ApplicationController
  skip_before_action :authorize_access
  def index
    @posts = Post.all
  end
end
