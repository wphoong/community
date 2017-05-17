require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  
  describe "posts#new action" do
    it "should successfully show the new posts form" do
      subcom = FactoryGirl.create(:subcommunity)

      get :new, params: { subcommunity_id: subcom.id }
      expect(response).to have_http_status(:success)

    end
  end

  describe "post#create action" do
    it "should successfully create a new post" do 
      subcom = FactoryGirl.create(:subcommunity)

      post :create, params: { subcommunity_id: subcom.id, post: { title: 'lul', description: 'kappa' } }
      expect(response).to redirect_to subcommunities_path
      expect(subcom.posts.length).to eq 1
      expect(subcom.posts.first.title).to eq('lul')
      expect(subcom.posts.first.description).to eq('kappa')
    end
  end
end
