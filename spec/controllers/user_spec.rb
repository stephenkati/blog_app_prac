require 'rails_helper'

RSpec.describe 'UsersContoller', type: :request do
  context 'GET /index' do
    before(:each) do
      get '/users'
    end
    
    it 'responds with 200 code' do
      expect(response).to have_http_status(200)
    end

    it 'respond with http success' do
      expect(response).to have_http_status(:success)
    end

    it 'to show index page template' do
      expect(response).to render_template(:index)
    end

    it 'respond with page header' do
      expect(response.body).to include('These are the users')
    end
  end

  context 'Get show page' do
    before(:each) do
      @user = User.create(id: 1, name: 'User 1')
      get '/users/1'
    end
    
    it 'responds with 200 code' do
      expect(response).to have_http_status(200)
    end

    it 'respond with http success' do
      expect(response).to have_http_status(:success)
    end

    it 'to show page template' do
      expect(response).to render_template(:show)
    end

    it 'respond with page header' do
      expect(response.body).to include('This is the user info')
    end
  end
end
