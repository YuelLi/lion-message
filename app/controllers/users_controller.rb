class UsersController < ApplicationController
skip_before_action :authorized, only: [:new, :create]
  def new
    @departments = Department.all()
  end

  def create
    begin
      if params[:email].split("@")[1]!="columbia.edu"
        flash[:alert] = "Please use columbia.edu email to register."
        redirect_to '/users/new'
      else
        @user = User.create(username: params[:username],
                            password: params[:password],
                            department: params[:department],
                            email:params[:email])
        @user.role= 'student'
        @user.save
        session[:user_id] = @user.id
        redirect_to '/welcome'
      end
    rescue ActiveRecord::RecordNotUnique
      flash[:alert] = "Username or email existed"
      redirect_to '/users/new'
    end
  end

  def show
  end 
end
