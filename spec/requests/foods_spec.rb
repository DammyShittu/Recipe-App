require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/foods/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/foods/show'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/foods/create'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /destroy' do
    it 'returns http success' do
      get '/foods/destroy'
      expect(response).to have_http_status(:success)
    end
  end
end
