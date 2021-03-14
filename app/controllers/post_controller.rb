class PostController < ApplicationController
  def show
    # user = User.find_by(id: session[:user_id])
    # @posts = user.posts
    @posts = Post.where(user_id: session[:user_id])
  end

  def new
  end

  def create
    user = User.find_by(id: session[:user_id])
    user.posts.create(:topic=>params[:topic],:department=>params[:department],:subject=>params[:subject],:body=>params[:body])
    redirect_to '/post/show'
  end

  def edit
  end

  def update
  end

  def delete
  end
end
