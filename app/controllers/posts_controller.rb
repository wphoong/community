class PostsController < ApplicationController

  def new
    @subcom = Subcommunity.find_by_id(params[:subcommunity_id])
    @post = Post.new
  end

  def create
    @subcom = Subcommunity.find_by_id(params[:subcommunity_id])
    @subcom.posts.create(post_params)

    redirect_to subcommunity_path(@subcom)
  end

  def show
    @subcom = Subcommunity.find(params[:subcommunity_id])
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @subcom = Subcommunity.find_by_id(params[:subcommunity_id])
    @post = Post.find(params[:id])
  end

  def update
    @subcom = Subcommunity.find_by_id(params[:subcommunity_id])
    @post = Post.find(params[:id])
    @post.update_attributes(post_params)
    redirect_to subcommunities_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to subcommunities_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :description)
  end

end
