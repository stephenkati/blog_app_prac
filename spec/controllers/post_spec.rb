require 'rails_helper'

RSpec.describe 'PostsContoller', type: :request do
  context 'Get index' do
    before(:each) do
      get '/users/9/posts'
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
      expect(response.body).to include('Here are the users posts')
    end
  end

  context 'Get show page' do
    before(:each) do
      get '/users/9/posts/2'
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
      expect(response.body).to include('Here is the post')
    end
  end
end
