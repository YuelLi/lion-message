require 'rails_helper'

RSpec.describe "Reply", type: :request do
    before(:each) do
        @user1 = User.create(username: 'yuankai', password: '123456',role: "student", department: "Computer Science")
        @user2 = User.create(username: 'yk', password: '123456', role: "faculty", department: "Computer Science")
        @p1 = Post.create()
        @p2 = Post.create()
        @p3 = Post.create(department: "Computer Science")
        @user1.posts<<@p1
        @user1.posts<<@p2
        @user2.posts<<@p3
        # simulate that user1 have logged in
        allow_any_instance_of(ActionDispatch::Request).to receive(:session) { { user_id: @user1.id } }
      end
    
      describe "GET /new" do
        it "returns http success" do
            get "/posts/1/replies/new"
            expect(response).to have_http_status(:success)
        end
    end
end
