require 'rails_helper'

RSpec.describe "Posts", type: :request do

  before(:each) do
    @user1 = User.create(username: 'yuankai', password: '123456',role: "student")
    @user2 = User.create(username: 'yk', password: '123456', role: "Computer Science")
    @p1 = Post.create()
    @p2 = Post.create()
    @p3 = Post.create(department: "Computer Science")
    @user1.posts<<@p1
    @user1.posts<<@p2
    @user2.posts<<@p3
    # simulate that user1 have logged in
    allow_any_instance_of(ActionDispatch::Request).to receive(:session) { { user_id: @user1.id } }
  end

  describe "GET /show" do
    it "show list the posts belong to the current student" do
      get posts_path
      expect(response).to have_http_status(:success)
      expect(assigns(:posts)).to eq([@p1,@p2])
    end

    it "show list the posts belong to the current faculty " do
      allow_any_instance_of(ActionDispatch::Request).to receive(:session) { { user_id: @user2.id } }
      get posts_path
      expect(response).to have_http_status(:success)
      expect(assigns(:posts)).to eq([@p3])
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/posts/new"
      expect(response).to have_http_status(:success)
    end
  end
  #
  describe "POST /create" do
    it "returns http success" do
      previous_post_count = @user1.posts.count()
      topic = "test topic"
      department = "test department"
      subject = "test subject"
      body = "test body"
      post posts_path, params: {topic: topic, department: department, subject: subject, body: body}
      expect(response).to redirect_to(posts_path)
      expect(@user1.posts.count()).to eq(previous_post_count + 1)
    end
  end
  #
  # describe "GET /edit" do
  #   it "returns http success" do
  #     get "/posts/edit"
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET /update" do
  #   it "returns http success" do
  #     get "/posts/update"
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET /delete" do
  #   it "returns http success" do
  #     get "/posts/delete"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
