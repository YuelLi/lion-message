require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /show" do
    before(:each) do
      @user1 = User.create(username: 'yuankai', password: '123456')
      @user2 = User.create(username: 'yuankai', password: '123456')
      @p1 = posts.create()
      @p2 = posts.create()
      @p3 = posts.create()
      @user1.posts<<@p1
      @user1.posts<<@p2
      @user2.posts<<@p3
    end

    it "show list the posts belong to the current user" do
      get "/post/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/post/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/post/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/post/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/post/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /delete" do
    it "returns http success" do
      get "/post/delete"
      expect(response).to have_http_status(:success)
    end
  end

end
