require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  
  describe "posts#new action" do
    it "should successfully show the new posts form" do
      subcom = FactoryGirl.create(:subcommunity)

      get :new, params: { subcommunity_id: subcom.id }
      expect(response).to have_http_status(:success)

    end
  end

  describe "posts#create action" do
    it "should successfully create a new post" do 
      subcom = FactoryGirl.create(:subcommunity)

      post :create, params: { subcommunity_id: subcom.id, post: { title: 'lul', description: 'kappa' } }
      expect(response).to redirect_to subcommunities_path
      expect(subcom.posts.length).to eq 1
      expect(subcom.posts.first.title).to eq('lul')
      expect(subcom.posts.first.description).to eq('kappa')
    end
  end

  describe "posts#show action" do
    it "should successfully show the post page" do
      subcom = FactoryGirl.create(:subcommunity)
      # post = FactoryGirl.create(:post)
      post = Post.find_by_id(:post)

      get :show, params: { subcommunity_id: subcom.id, id: post.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "posts#edit" do
    it "should successfully show the edit post form" do
      subcom = FactoryGirl.create(:subcommunity)

      post = Post.find_by_id(:post)
      get :edit, params: { id: post.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "posts#update" do
    it "should successfully show the edit post form" do
      subcom = FactoryGirl.create(:subcommunity)
      post = FactoryGirl.create(:post, title: 'intial')
      patch :update, params: { id: post.id, post: { title: 'changed' } }
      expect(response).to redirect_to subcommunities_path

      post.reload
      expect(post.title).to eq('changed')

    end
  end

  describe "posts#destroy" do
    it "should successfully show the edit post form" do
      subcom = FactoryGirl.create(:subcommunity)
      post = FactoryGirl.create(:post)

      delete :destroy, params: { id: post.id }
      post1 = Post.find_by_id(post.id)
      expect(post1).to eq nil
    end
  end
end
