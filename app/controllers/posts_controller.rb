class PostsController < ApplicationController

  def new
    @post = Post.new
    @subcom = Subcommunity.find_by_id(params[:subcommunity_id])
  end

  def create
    @subcom = Subcommunity.find_by_id(params[:subcommunity_id])
    @subcom.posts.create(post_params)

    redirect_to subcommunities_path
  end

  def show
    @subcom = Subcommunity.find_by_id(params[:subcommunity_id])
    @post = Post.find_by_id(params[id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :description)
  end

end
