require 'rails_helper'

RSpec.describe "Reply", type: :request do
  before(:each) do
    @user1 = User.create(username: 'yuankai', password: '123456',role: "student", department: "Computer Science")
    @user2 = User.create(username: 'yk', password: '123456', role: "faculty", department: "Computer Science")
    @p1 = Post.create()
    @p2 = Post.create()
    @p3 = Post.create(department: "Computer Science")
    @r1 = Reply.create(content: "I like CS")
    @user1.posts<<@p1
    @user1.posts<<@p2
    @user2.posts<<@p3
    @p1.replies << @r1
    @user1.replies << @r1
    # simulate that user1 have logged in
    allow_any_instance_of(ActionDispatch::Request).to receive(:session) { { user_id: @user1.id } }
  end

  describe "GET /new" do
    it "returns http success" do
      get new_post_reply_path(@p1)
      expect(response).to have_http_status(:success)
    end
  end

  describe "Post /create" do
    it "create a new reply" do
      previous_count = Reply.count()
      post post_replies_path(@p1), params:{:content => "test_content"}
      expect(response).to redirect_to(post_replies_path(@p1))
      expect(Reply.count()).to eq(previous_count+1)
    end

    it "should not create a new reply with empty content" do
      previous_count = Reply.count()
      post post_replies_path(@p1), params:{:content => ""}
      expect(response).to redirect_to(new_post_reply_path(@p1))
      expect(flash[:alert]).to eq("Content must be filled.")
      expect(Reply.count()).to eq(previous_count)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get edit_post_reply_path(@p1,@r1)
      expect(response).to have_http_status(:success)
      expect(assigns[:replies]).to eq([@r1])
      expect(assigns[:user_id_to_username]).to eq({@user1.id => @user1.username})
    end
  end

  describe "PUT /update" do
    it "update a reply with non-empty content" do
      put post_reply_path(@p1,@r1), params: {:content => "updated content"}
      expect(response).to redirect_to(post_replies_path(@p1))
      expect(Reply.find(@r1.id).content).to eq("updated content")
    end

    it "should not update a reply with empty content" do
      put post_reply_path(@p1,@r1), params: {:content => ""}
      expect(response).to redirect_to(edit_post_reply_path(@p1,@r1))
      expect(flash[:alert]).to eq("Content must be filled.")
    end
  end
end
