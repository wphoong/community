require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
 
  # describe "comments#create action" do
  #   it "should successfully create a new comment in its subcommunity" do
  #     post :create, params: { comment: { message: 'New' } }
  #     expect(response).to redirect_to root_path

  #     comment = Comment.last
  #     expect(comment.message).to eq("New")
  #   end
  # end

  # describe "comments#edit action" do
  #   it "should successfuly show the edit comment form" do
  #     comment = FactoryGirl.create(:comment)
  #     get :edit, params: { id: comment.id}
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "comments#update action" do
  #   it "should successfully update the comment" do
  #     comment = FactoryGirl.create(:comment, message: "LUL")
  #     patch :update, params: { id: comment.id, message: "Changed" }
  #     comment.reload
  #     expect(comment.message).to eq("changed")
  #   end
  # end

  # describe "comments#destroy action" do
  #   it "should successfully destroy the comment" do
  #     comment = FactoryGirl.create(:comment)
  #     delete :destroy, params: { id: comment.id }
  #     expect(response).to redirect_to root_path

  #     comment1 = FactoryGirl.find_by_id(comment.id)
  #     expect(comment).to eq nil
  #   end
  # end
end
