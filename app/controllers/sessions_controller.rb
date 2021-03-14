class SessionsController < ApplicationController
skip_before_action :authorized, only: [:new, :create, :welcome]
  def new
    if session[:user_id] != nil
      redirect_to '/welcome'
    end
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
       session[:user_id] = @user.id
       redirect_to '/welcome'
    else
       flash[:alert] = "Wrong username or password"
       redirect_to '/login'
    end
  end

  def logout
    # @user = nil
    session[:user_id] = nil
    redirect_to '/login'
  end

  def login
  end

  def welcome
    redirect_to '/post/show'
  end

  def page_requires_login
  end
end
