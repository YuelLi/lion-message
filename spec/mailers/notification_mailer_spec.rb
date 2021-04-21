require "rails_helper"

RSpec.describe NotificationMailer, type: :mailer do

    before(:each) do
        @user = User.new(username: 'yuankai', password: '123456',role: "student", email:"yk@columbia.edu",department: "Computer Science")
        @post = Post.new(subject: "Course problem", department: "Electrical Engineering",body:"Anything")
        @user.posts<<@post
        @reply = Reply.new(content: "I like CS")
        @user.replies << @reply
    end
    describe "welcome" do
        let(:mail) { NotificationMailer.with(user: @user).new_user_email}

        it "renders the welcome mails" do 
            expect(mail.subject).to eq("Welcome to Lion Message")
            expect(mail.to).to eq(["yk@columbia.edu"])
        end 
    end

    describe "welcome" do
        let(:mail) { NotificationMailer.with(reply: @reply, post:@post).new_reply_email}

        it "renders the reply mails" do 
            expect(mail.subject).to eq("You get a new reply!")
            expect(mail.to).to eq(["yk@columbia.edu"])
        end 
    end
end
