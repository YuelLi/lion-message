class UsersController < ApplicationController
skip_before_action :authorized, only: [:new, :create]
  def new
    @departments = Department.all()
  end

  def create
    begin
      @user = User.create(username: params[:username],
                          password: params[:password], 
                          department: params[:department],
                          email:params[:email])
      @user.role= 'student'
      @user.save
      session[:user_id] = @user.id
      redirect_to '/welcome'
    rescue ActiveRecord::RecordNotUnique
      flash[:alert] = "Username or email existed"
      redirect_to '/users/new'
    end
  end

  def show
  end 
end
