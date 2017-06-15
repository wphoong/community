class StaticPagesController < ApplicationController
  def index
    @posts = Post.all
    @subcom = Subcommunity.find_by(params[:subcommunity_id])
  end
end
