require 'rails_helper'

RSpec.describe "Likes", type: :request do
  describe "GET /add" do
    it "returns http success" do
      get "/likes/add"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /remove" do
    it "returns http success" do
      get "/likes/remove"
      expect(response).to have_http_status(:success)
    end
  end

end
