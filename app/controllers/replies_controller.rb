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
    @post = Post.find params[:post_id]
    if params[:content] == nil or params[:content] == ""
      flash[:alert] = "Content must be filled."
      redirect_to new_post_reply_path(@post)
    else
      @reply = @post.replies.build(:content => params[:content])
      @reply.user = current_user
      @reply.save
      if current_user.role == 'faculty'
        @post.update(tag:"Faculty made a reply")
      else
        @post.update(tag:"Student made a reply")
      end
      redirect_to post_replies_path(@post)
    end
  end
  
  def new
    @post = Post.find params[:post_id]
  end

  def edit
    post_id = params[:post_id]
    reply_id = params[:id]
    @post = Post.find(post_id)
    @reply = Reply.find(reply_id)
    @replies, @user_id_to_username = Post.usernames_by_reply(@post)
  end

  def update
    @post = Post.find params[:post_id]
    @reply = Reply.find params[:id]
    if params[:content] == nil or params[:content] == ""
      flash[:alert] = "Content must be filled."
      redirect_to edit_post_reply_path(@post, @reply)
    else
      @reply.update(content: params[:content])
      if current_user.role == 'faculty'
        @post.update(tag:"Faculty updated a reply")
      else
        @post.update(tag:"Student updated a reply")
      end
      redirect_to post_replies_path(@post)
    end
  end

end
