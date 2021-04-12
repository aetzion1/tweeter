class PostsController < ApplicationController
  def new
    @post = Post.new
  end
    
  def create
    post = post_params
    post[:user_id] = current_user.id
    new_post = current_user.posts.new(post)
    if new_post.save
      redirect_to dashboard_path, notice: 'Yo! Nice post!'
    else
      flash[:error] = 'Try again'
      redirect_to dashboard_path
    end
  end

  private

  def post_params
    params[:post][:user_is] = current_user.id
    params.require(:post).permit(:text, :user_id)
  end

end