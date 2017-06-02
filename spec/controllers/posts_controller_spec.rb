require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:subcom) { FactoryGirl.create(:subcommunity) }
  # let(:post) { FactoryGirl.create(:post) }

  describe "posts#new action" do
    it "should require users is signed in" do
      get :new, params: { subcommunity_id: subcom.id}
      expect(response).to redirect_to new_user_session_path
    end

    it "should successfully show the new posts form" do
      sign_in user
      get :new, params: { subcommunity_id: subcom.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "posts#create action" do

    it "should successfully create a new post" do 
      sign_in user

      post :create, params: { subcommunity_id: subcom.id, post: { title: 'LUL', description: 'Kappa'} }
      expect(response).to redirect_to subcommunity_path(subcom.id)
      
      expect(subcom.posts.length).to eq 1
      
    end
  end

  describe "posts#show action" do
    it "should successfully show the post page if found" do
      post = FactoryGirl.create(:post)
      get :show, params: { subcommunity_id: subcom.id, id: post.id }
      expect(response).to have_http_status(:success)
    end

    it "should return a 404 error if the post is not found" do
      
      get :show, params: { subcommunity_id: subcom.id , id: 'TACOCAT'}
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "posts#edit" do
    it "should successfully show the edit post form" do
      sign_in subcom.user

      post = FactoryGirl.create(:post)

      get :edit, params: { subcommunity_id: subcom.id, id: post.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "posts#update" do
    it "should successfully show the edit post form" do
      sign_in subcom.user

      post = FactoryGirl.create(:post, title: 'intial')
      patch :update, params: { subcommunity_id: subcom.id, id: post.id, post: { title: 'changed' } }
      expect(response).to redirect_to subcommunities_path

      post.reload
      expect(post.title).to eq('changed')

    end
  end

  describe "posts#destroy" do
    it "should successfully show the edit post form" do
      sign_in subcom.user
      post = FactoryGirl.create(:post)

      delete :destroy, params: { subcommunity_id: subcom.id, id: post.id }
      post1 = Post.find_by_id(post.id)
      expect(post1).to eq nil
    end
  end
end
