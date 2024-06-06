require 'rails_helper'


RSpec.describe "Users", type: :request do
  let(:user){User.create(username:'test',password:'123456',email:'test@email.com')}
  describe "GET /users" do
    context 'when authenticated' do
    it "returns 200 status code" do
      sign_in user
      get users_path
      expect(response).to have_http_status(200)
    end
  end
  context 'when not authenticated' do 
    it 'returns 302 status code' do 
      get users_path
      expect(response).to have_http_status(302)
    end
  end
end
  
end

