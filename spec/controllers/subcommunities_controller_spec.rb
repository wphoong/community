require 'rails_helper'

RSpec.describe SubcommunitiesController, type: :controller do

  describe "static_pages#index" do
    it "should successfully show the index page" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "subcommunities#index" do
    it "should successfully show the index page" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "subcommunities#new" do
    it "should successfully show the new subcommunity form" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "subcommunities#create" do
    it "should successfully create a new subcommunity in our database" do
      post :create, params: { subcommunity: { title: "Nub", slogan: 'For nubs' } }
      expect(response).to redirect_to root_path

      subcom = Subcommunity.last
      expect(subcom.title).to eq("Nub")
      expect(subcom.slogan).to eq("For nubs")
    end
  end
end
