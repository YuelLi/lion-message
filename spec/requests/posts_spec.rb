require 'rails_helper'

RSpec.describe "Posts", type: :request do

  before(:each) do
    @department1 = Department.create(name: "Computer Science")
    @department2 = Department.create(name: "Electrical Engineering")
    @user1 = User.create(username: 'yuankai', password: '123456',role: "student", department: "Computer Science")
    @user2 = User.create(username: 'yk', password: '123456', role: "faculty", department: "Computer Science")
    @p1 = Post.create(subject: "Course problem", department: "Electrical Engineering",body:"Anything")
    @p2 = Post.create(department: "Computer Science")
    @p3 = Post.create(department: "Computer Science")
    @r1 = Reply.create(content: "I like CS")
    @r2 = Reply.create(content: "I don't like CS")
    @user1.posts<<@p1
    @user1.posts<<@p2
    @p1.replies << @r1
    @p1.replies << @r2
    @user1.replies << @r1
    @user1.replies << @r2
    # simulate that user1 have logged in
    allow_any_instance_of(ActionDispatch::Request).to receive(:session) { { user_id: @user1.id } }
  end

  describe "GET /index" do
    it "index list the posts belong to the current student" do
      get posts_path
      expect(response).to have_http_status(:success)
      expect(assigns(:posts)).to eq(@user1.posts.order(created_at: :desc))
    end

    it "index sorted list the posts" do
      get posts_path params: {sort: "department"}
      expect(response).to have_http_status(:success)
      expect(assigns(:posts)).to eq(@user1.posts.order(:department, created_at: :desc))
    end

    it "index list the posts belong to the current faculty" do
      allow_any_instance_of(ActionDispatch::Request).to receive(:session) { { user_id: @user2.id } }
      get posts_path
      expect(response).to have_http_status(:success)
      expect(assigns(:posts)).to eq(Post.where(:department => "Computer Science").order(created_at: :desc))
    end

    it "index list the posts according to the search" do
      allow_any_instance_of(ActionDispatch::Request).to receive(:session) { { user_id: @user1.id } }
      get posts_path params: {post_content: "course"}
      expect(response).to have_http_status(:success)
      expect(assigns(:posts)).to eq(Post.where(id: @p1.id).order(created_at: :desc))
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/posts/new"
      expect(response).to have_http_status(:success)
      expect(assigns(:departments)).to eq([@department1.name,@department2.name])
    end
  end

  describe "POST /create" do
    it "create a new post if department,subject and body are not empty" do
      previous_post_count = @user1.posts.count()
      topic = "test topic"
      department = "test department"
      subject = "test subject"
      body = "test body"
      post posts_path, params: {topic: topic, department: department, subject: subject, body: body}
      expect(response).to redirect_to(posts_path)
      expect(@user1.posts.count()).to eq(previous_post_count + 1)
    end

    it "return to new page if department,subject or body are empty" do
      previous_post_count = @user1.posts.count()
      topic = "test topic"
      department = ""
      subject = "test subject"
      body = ""
      post posts_path, params: {topic: topic, department: department, subject: subject, body: body}
      expect(response).to redirect_to(new_post_path)
      expect(@user1.posts.count()).to eq(previous_post_count)
      expect(flash[:alert]).to eq("Department, Subject and Body must be filled.")
    end
  end

  describe "GET /show" do
    it "returns show page" do
      get post_path(@p1)
      expect(response).to have_http_status(:success)
      expect(assigns(:replies)).to eq(@p1.replies.order(created_at: :desc))
      expect(assigns(:user_id_to_username)).to eq({@user1.id => @user1.username})
    end

    it "returns index page if the current user is not authorized to view this post" do
      allow_any_instance_of(ActionDispatch::Request).to receive(:session) { { user_id: @user2.id } }
      get post_path(@p1)
      expect(response).to redirect_to(posts_path)
      expect(flash[:error]).to eq('unauthorized access!')
    end
  end

  describe "GET /edit" do
    it "returns edit page if the current user is authorized to edit" do
      get edit_post_path(@p1)
      expect(assigns(:post)).to eq(@p1)
      expect(response).to have_http_status(:success)
    end

    it "returns index page if the current user is not authorized to edit" do
      allow_any_instance_of(ActionDispatch::Request).to receive(:session) { { user_id: @user2.id } }
      get edit_post_path(@p1)
      expect(response).to redirect_to(posts_path)
      expect(flash[:error]).to eq('unauthorized access!')
    end
  end

  describe "GET /update" do
    it "update post body if the body is not empty" do
      put post_path(@p1), params: {body: "Something"}
      expect(response).to redirect_to(post_path(@p1))
      expect(Post.find(@p1.id).body).to eq("Something")
    end

    it "redirect to edit page if the body is empty " do
      put post_path(@p1), params: {body: ""}
      expect(response).to redirect_to(edit_post_path(@p1))
      expect(flash[:alert]).to eq("Body must be filled.")
    end
  end
  #
  # describe "GET /delete" do
  #   it "returns http success" do
  #     get "/posts/delete"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
