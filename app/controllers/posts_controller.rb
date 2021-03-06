class PostsController < ApplicationController
  def index
    # user = User.find_by(id: session[:user_id])
    # @posts = user.posts
    # if params[:sort] == nil && session[:sort] != nil
    #   params[:sort] = session[:sort]
    #   redirect_to(posts_path({:sort => session[:sort]}))
    # end
    # if session[:sort] != params[:sort]
    #   session[:sort] = params[:sort]
    # end
    current_user = User.find(session[:user_id])
    if current_user.role == "student"
      @posts = current_user.posts
    else
      @posts = Post.where(:department => current_user.department)
    end
    if params[:post_content] != nil && params[:post_content] != ""
      @posts = Post.like_search(@posts,params[:post_content])
    end
    # filter by topic
    if params[:filter_topic] != nil && params[:filter_topic] != ""
      @posts = Post.filter_by_topic(@posts, params[:filter_topic])
    end
    # filter by tag
    if params[:filter_tag] != nil && params[:filter_tag] != ""
      @posts = Post.filter_by_tag(@posts, params[:filter_tag])
    end
    # sort
    if params[:sort]=='department'
      @posts = @posts.order(:department, created_at: :desc)
    else
      @posts = @posts.order(created_at: :desc)
    end
    @post_content = params[:post_content]
  end

  def new
    @departments = []
    Department.all().each do |department|
      @departments << department.name
    end
    @user_department = User.find(session[:user_id]).department
  end

  def create
    if params[:department] == nil or params[:department] == "" or
        params[:subject] == nil or params[:subject] == "" or
        params[:body] == nil or params[:body] == ""
      flash[:alert] = "Department, Subject and Body must be filled."
      redirect_to new_post_path
    else
      user = User.find_by(id: session[:user_id])
      user.posts.create(:topic=>params[:topic],:department=>params[:department],
                        :subject=>params[:subject],:body=>params[:body],:tag => "Post created")
      redirect_to posts_path
    end
  end

  def show
    id = params[:id]
    @post = Post.find(id)
    if (current_user.role == 'student' and @post.user != current_user) or (current_user.role == 'faculty' and @post.department != current_user.department)
      flash[:error] = 'unauthorized access!'
      redirect_to posts_path
    end
    @replies, @user_id_to_username = Post.usernames_by_reply(@post)
    if request.xhr?
      respond_to do |format|
        format.json {render json: {post_id: id,replies:@replies,id_name_dict:@user_id_to_username}}
        # format.html
      end
    end
  end

  def edit
    id = params[:id]
    @post = Post.find(id)
    if @post.user != current_user
      flash[:error] = 'unauthorized access!'
      redirect_to posts_path
    end
  end

  def update
    @post = Post.find params[:id]
    if params[:tag] != nil and params[:tag] != ""
      @post.update(tag:params[:tag])
      redirect_to post_path(@post)
    elsif params[:body] == nil or params[:body] == ""
       flash[:alert] = "Body must be filled."
       redirect_to edit_post_path(@post)
    else
      @post.update(body:params[:body],tag:"Post content updated")
      redirect_to post_path(@post)
    end
  end

  def delete
  end

end
