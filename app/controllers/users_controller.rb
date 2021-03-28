class UsersController < ApplicationController
skip_before_action :authorized, only: [:new, :create]
  def new
    @departments = Department.all()
  end

  def create
    @user = User.create(username: params[:username],
                        password: params[:password], 
                        password: params[:department])
    @user.role= 'student'
    @user.save
    session[:user_id] = @user.id
    redirect_to '/welcome'
  end

  def show
  end 
end
