require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/users/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "create a new user account and store it in database" do
      username = "testusername"
      password = "testpassword"
      previous_user_count = User.count()
      post "/users/create", params: {username: username, password:password}
      expect(User.count()).to eq(previous_user_count+1)
      expect(response).to redirect_to("/welcome")
    end
  end

end
