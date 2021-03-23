class PostsController < ApplicationController
  def index
    # user = User.find_by(id: session[:user_id])
    # @posts = user.posts
    current_user = User.find(session[:user_id])
    if current_user.role == "student"
      @posts = current_user.posts
    else
      @posts = Post.where(:department => current_user.role)
    end
  end

  def new
  end

  def create
    user = User.find_by(id: session[:user_id])
    user.posts.create(:topic=>params[:topic],:department=>params[:department],
                      :subject=>params[:subject],:body=>params[:body])
    redirect_to posts_path
  end

  def edit
  end

  def update
  end

  def delete
  end
end
