require 'rails_helper'

RSpec.describe "Users", type: :request do
  before(:each) do
    @user = User.create(username: 'yuankai', password: '123456',email: "yk@columbia.edu")
    @user2 = User.create(username: 'yk', password: '123456',email: "anotheryk@columbia.edu")
  end

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
      email = "test@columbia.edu"
      previous_user_count = User.count()
      post "/users/create", params: {username: username, password:password, email:email}
      expect(User.count()).to eq(previous_user_count+1)
      expect(response).to redirect_to("/welcome")
    end

    it "create a new user account with non columbia email" do 
      username = "testusername"
      password = "testpassword"
      email = "test@gmail.com"
      post "/users/create", params: {username: username, password:password, email:email}
      expect(flash[:alert]).to eq("Please use columbia.edu email to register.")
      expect(response).to redirect_to("/users/new")  
    end  

    it "create a new user with already existing username" do
      username = "yuankai"
      password = "yuankai123"
      email = "yk@columbia.edu"
      post "/users/create", params: {username: username, password:password, email:email}
      expect(flash[:alert]).to eq("Username or email existed")
      expect(response).to redirect_to("/users/new")  
    end

  end

  describe "GET /user" do
    context "A user already logged in" do
      it "return http success" do
        allow_any_instance_of(ActionDispatch::Request).to receive(:session) { { user_id: @user.id } }
        get "/user"
        expect(response).to have_http_status(:success)  
      end
    end
    context "No user logged in" do
      it "redirect to login page" do
        get "/user"
        expect(response).to have_http_status(:redirect) 
      end
    end
  end

  describe "POST /user" do
    context "A user already logged in" do
      it "redirect to user page and data updated" do
        allow_any_instance_of(ActionDispatch::Request).to receive(:session) {{ user_id: @user.id }}
        post "/user", params: {email:"yk@columbia.edu", department: 'Computer Science'}
        expect(flash[:success]).to eq("Successfully updated")
        expect(response).to have_http_status(:redirect)
      end

      it "redirect to user with alert if non-columbia email filled in" do 
        allow_any_instance_of(ActionDispatch::Request).to receive(:session) {{ user_id: @user.id }}
        post "/user", params: {email:"yk@gmail.com", department: 'Computer Science'}
        expect(flash[:alert]).to eq("Please use columbia.edu email to register.")
        expect(response).to have_http_status(:redirect)
      end

      it "redirect to user with alert if existed email filled in" do
        allow_any_instance_of(ActionDispatch::Request).to receive(:session) {{ user_id: @user.id }}
        post "/user", params: {email:"anotheryk@columbia.edu", department: 'Computer Science'}
        expect(flash[:alert]).to eq("Email existed")
        expect(response).to have_http_status(:redirect)
      end
    end

    context "No user logged in" do
      it "redirect to login page" do
        post "/user", params: {email:"yk@columbia.edu", department: 'Computer Science'}
        expect(response).to have_http_status(:redirect) 
      end
    end
  end
  

end
