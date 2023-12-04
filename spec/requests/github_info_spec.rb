require 'rails_helper'

RSpec.describe "GithubInfos", type: :request do
  describe "GET /index" do
    it "renders the index template" do
      get '/'
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end

    it "renders user information when valid login" do
      get '/github_info/get_info', params: { github_login: 'setwith' }
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
      expect(response.body).to include('User Info:')
      expect(response.body).to include('Repositories:')
    end

    it "renders an error message when invalid login" do
      get '/github_info/get_info', params: { github_login: 'invalid_login' }
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
      expect(response.body).to include('Name not found for the given GitHub account')
    end

    it "renders a message when no login" do
      get '/github_info/get_info'
      expect(response).to have_http_status(200)
      expect(assigns(:user_info)['name']).to be_nil
      expect(assigns(:user_info)['repos']).to be_nil
      expect(response).to render_template(:index)
      expect(response.body).to include('Name not found for the given GitHub account')
    end
  end
end
