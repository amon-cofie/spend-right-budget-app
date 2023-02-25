require 'rails_helper'

RSpec.describe ExpensesController, type: :request do
  describe 'expenses controller' do
    before(:each) do
      allow_any_instance_of(ApplicationController).to receive(:authenticate_user!).and_return(true)
      test_category = Category.create(name: 'test category', icon: 'test icon')
      get category_expenses_path(test_category.id.to_i)
    end

    it 'renders index action' do
      expect(response).to render_template(:index)
    end

    it 'returns status code ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns text on index page' do
      expect(response.body).to include('TRANSACTIONS')
    end
  end
end
