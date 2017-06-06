require 'rails_helper'

RSpec.describe SubcommunitiesController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:subcom) { FactoryGirl.create(:subcommunity) }

  describe 'static_pages#index action' do
    it 'should successfully show the index page' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'subcommunities#index action' do
    it 'should successfully show the subcommunities index page' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'subcommunities#new action' do
    it 'should require users to be logged in' do
      get :new
      expect(response).to redirect_to new_user_session_path
    end

    it 'should successfully show the new subcommunity form' do
      sign_in user

      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'subcommunities#create action' do
    it 'should successfully create a new subcommunity in our database' do
      sign_in user

      post :create, params: { subcommunity: { title: 'Nub', slogan: 'For nubs' } }
      expect(response).to redirect_to root_path

      subcom = Subcommunity.last
      expect(subcom.title).to eq('Nub')
      expect(subcom.slogan).to eq('For nubs')
    end
  end

  describe 'subcommunities#show action' do
    it 'should successfully show each subcommunity page' do
      get :show, params: { id: subcom.id }
      expect(response).to have_http_status(:success)
    end

    it 'should have a 404 error if the subcommunity cannot be found' do
      get :show, params: { id: 'LUL' }
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'subcommunities#edit action' do
    it 'should successfully show the subcommunity edit page' do
      sign_in subcom.user
      get :edit, params: { id: subcom.id }
      expect(response).to have_http_status(:success)
    end

    it 'should have a 404 error if the subcommunity cannot be found' do
      sign_in user
      get :edit, params: { id: 'LUL' }
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'subcommunities#update action' do
    it 'should successfully update the subcommunity title' do
      subcom = FactoryGirl.create(:subcommunity, title: 'Initial Value')
      sign_in subcom.user

      patch :update, params: { id: subcom.id, subcommunity: { title: 'Changed' } }
      expect(response).to redirect_to subcommunities_path

      subcom.reload
      expect(subcom.title).to eq('Changed')
    end

    it 'should successfully update the subcommunity slogan' do
      subcom = FactoryGirl.create(:subcommunity, slogan: 'Initial Value')
      sign_in subcom.user

      patch :update, params: { id: subcom.id, subcommunity: { slogan: 'Changed' } }
      expect(response).to redirect_to subcommunities_path

      subcom.reload
      expect(subcom.slogan).to eq('Changed')
    end
  end

  describe 'subcommunities#destroy action' do
    it 'should successfully delete a subcommunity' do
      sign_in subcom.user
      delete :destroy, params: { id: subcom.id }
      expect(response).to redirect_to root_path
      subcom1 = Subcommunity.find_by_id(subcom.id)
      expect(subcom1).to eq nil
    end
  end
end
