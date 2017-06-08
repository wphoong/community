require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  describe 'users#show' do
    it 'should show user profile page' do
      sign_in user
      get :show, params: { id: user.id }
      expect(response).to have_http_status(:success)
    end
  end
end
