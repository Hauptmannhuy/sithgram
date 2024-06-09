require 'rails_helper'


RSpec.describe "Users", type: :request do
  let(:user){User.create(username:'test',password:'123456',email:'test@email.com')}
  describe "Authenticated user" do
    context 'when visiting /users' do
    it "returns 200 status code and displays content" do
      sign_in user
      get users_path
      expect(response.body).to include("#{user.username}")
      expect(response).to have_http_status(200)
    end
  end
  context 'when visiting /friends/list' do
    it "returns 200 status code and displays content" do
      sign_in user
      get friends_list_path
      expect(response.body).to include("Friends")
      expect(response).to have_http_status(200)
    end
  end
  context 'when visiting /users/id' do
    it "returns 200 status code and displays content" do
      sign_in user
      get user_path(user)
      expect(response.body).to include("#{user.username}")

      expect(response).to have_http_status(200)
    end
  end
  context 'when visiting /posts' do
    it "returns 200 status code and displays content" do
      sign_in user
      get posts_path
      notif = "You haven't created any posts or followed someone to see feed yet."
      expect(response.body).to include(notif)
      expect(response).to have_http_status(200)
    end
  end
end
describe "Not authenticated user" do

  context 'when visiting /users' do 
    it 'returns 302 status code' do 
      get users_path
      expect(response).to have_http_status(302)
    end
  end
end
  
end

