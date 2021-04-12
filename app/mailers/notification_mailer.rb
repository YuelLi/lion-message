class NotificationMailer < ApplicationMailer
    def new_user_email
        @user= params[:user]
        mail(to: @user.email, subject: "Welcome to Lion Message" )
    end 

    def new_reply_email
        @reply = params[:reply]
        @post = params[:post]
        mail(to: @post.user.email, subject: "You get a new reply!")
    end
end
