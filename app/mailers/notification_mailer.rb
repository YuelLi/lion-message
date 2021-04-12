class NotificationMailer < ApplicationMailer
    def new_reply_email
        @reply = params[:reply]
        @post = params[:post]
        mail(to: @post.user.email, subject: "You get a new reply!")
    end
end
