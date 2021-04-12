# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview
    def new_reply_email
        @user1 = User.new(username: 'yuli', password: '123456', email:"yl4736@columbia.edu", role: "student", department: "Computer Science")
        @user2 = User.new(username: 'cs1', password: '123456', email:"cs1@columbia.edu", role: "faculty", department: "Computer Science")

        @post = Post.new(subject: "Course problem", department: "Computer Science")
        @user1.posts << @post
        @reply = Reply.new(content: "No problem")
        @user2.replies << @reply
        @post.replies << @reply

        NotificationMailer.with(post:@post,reply:@reply).new_reply_email
    end
end
