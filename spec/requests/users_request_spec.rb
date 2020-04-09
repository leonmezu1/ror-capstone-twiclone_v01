require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/index'
      expect(response).to have_http_status(302)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users/show'
      expect(response).to have_http_status(302)
    end
  end
end
