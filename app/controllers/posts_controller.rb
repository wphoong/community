class PostsController < ApplicationController

  def new
    @subcom = Subcommunity.find_by_id(params[:subcommunity_id])
    @post = Post.new
  end

  def create
    @subcom = Subcommunity.find_by_id(params[:subcommunity_id])
    @subcom.posts.create(post_params)

    redirect_to subcommunities_path
  end

  def show
    @subcom = Subcommunity.find(params[:subcommunity_id])
    @posts = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :description)
  end

end
