require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  before(:each) do
    @user = User.create(username: 'yuankai', password: '123456')
  end

  describe "GET /login" do
    it "returns login page when the user has not logged in" do
      get "/login"
      expect(response).to have_http_status(:success)
    end

    it "redirect to welcome when the user has already logged in" do
      allow_any_instance_of(ActionDispatch::Request).to receive(:session) { { user_id: @user.id } }
      get "/login"
      expect(response).to redirect_to("/welcome")
    end
  end

  describe "POST /login" do
    it "redirect to welcome when the user successfully logs in" do
      post "/login", params: {username: 'yuankai', password: '123456'}
      expect(response).to redirect_to("/welcome")
    end

    it "redirect to login when the user fails to log in" do
      post "/login", params: {username: 'yuankai', password: '654321'}
      expect(flash[:alert]).to eq("Wrong username or password")
      expect(response).to redirect_to("/login")
    end
  end

  describe "GET /logout" do
    it "returns http success" do
      allow_any_instance_of(ActionDispatch::Request).to receive(:session) { { user_id: @user.id } }
      get "/logout"
      expect(response).to redirect_to("/login")
    end
  end

  describe "GET /welcome" do
    it "redirect to post page if log in" do
      get "/welcome"
      allow_any_instance_of(ActionDispatch::Request).to receive(:session) { { user_id: @user.id } }
      expect(response).to redirect_to(posts_path)
    end
  end

end
