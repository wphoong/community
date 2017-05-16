require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  
  describe "posts#new action" do
    it "should successfully show the new posts form" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
end
