require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:subcom) { FactoryGirl.create(:subcommunity) }
  let(:posts) { FactoryGirl.create(:post) }

  describe 'comments#create action' do
    it 'create a new comment in its post' do
      sign_in user

      post :create, params: { subcommunity_id: subcom.id, post_id: posts.id, comment: { message: 'new' } }
      expect(response).to redirect_to subcommunity_post_path(subcom.id, posts.id)

      comment1 = Comment.last
      expect(comment1.message).to eq('new')
    end
  end

  describe 'comments#update action' do
    it 'should successfully update the comment' do
      comment = FactoryGirl.create(:comment)
      sign_in comment.user

      patch :update, params: { subcommunity_id: subcom.id, post_id: posts.id, id: comment.id, comment: { message: 'Changed' } }

      comment.reload
      expect(comment.message).to eq('Changed')
    end
  end

  describe 'comments#destroy action' do
    it 'should successfully destroy the comment' do
      comment = FactoryGirl.create(:comment)
      sign_in comment.user

      delete :destroy, params: { subcommunity_id: subcom.id, post_id: posts.id, id: comment.id }
      comment1 = Comment.find_by_id(comment.id)

      expect(comment1).to eq nil
    end
  end
end
