class RepliesController < ApplicationController

  def index
    @post = Post.find params[:post_id]
    @replies = Reply.where(:post_id => @post)
    @user_id_to_username = {}
    @replies.each do |reply|
      user = User.find reply.user_id
      username = user.username
      @user_id_to_username[reply.user_id] = username
    end
  end

  def create
    if params[:content] == nil or params[:content] == ""
      flash[:alert] = "Content must be filled."
      redirect_to new_post_reply_path
    else
      @post = Post.find params[:post_id]
      @reply = @post.replies.build(:content => params[:content])
      @reply.user = current_user
      @reply.save
      redirect_to post_replies_path(@post)
    end
  end
  
  def new
    @post = Post.find params[:post_id]
  end
end
