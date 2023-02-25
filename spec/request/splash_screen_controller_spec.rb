require 'rails_helper'

RSpec.describe SplashScreenController, type: :request do
  describe 'splash screen controller' do
    before(:each) do
      allow_any_instance_of(ApplicationController).to receive(:authenticate_user!).and_return(true)
      get '/'
    end

    it 'renders index action' do
      expect(response).to render_template(:index)
    end

    it 'returns status code ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns text on index page' do
      expect(response.body).to include('Spend Right')
    end
  end
end
