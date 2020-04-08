require 'rails_helper'

RSpec.describe "Followings", type: :request do

  describe "GET /create" do
    it "returns http success" do
      get "/followings/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/followings/destroy"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/followings/update"
      expect(response).to have_http_status(:success)
    end
  end

end
