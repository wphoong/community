class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  def new
    @subcom = Subcommunity.find_by_id(params[:subcommunity_id])
    @post = Post.new
  end

  def create
    @subcom = Subcommunity.find_by_id(params[:subcommunity_id])
    @subcom.posts.create(post_params.merge(user: current_user))

    redirect_to subcommunity_path(@subcom)
  end

  def show
    @subcom = Subcommunity.find_by_id(params[:subcommunity_id])
    @post = Post.find_by_id(params[:id])
    return render_not_found if @post.blank?
    @comment = Comment.new
  end

  def edit
    @subcom = Subcommunity.find_by_id(params[:subcommunity_id])
    @post = Post.find(params[:id])
    return render_forbidden if @post.user != current_user
    return render_not_found if @post.blank?
  end

  def update
    @subcom = Subcommunity.find_by_id(params[:subcommunity_id])
    @post = Post.find(params[:id])
    return render_forbidden if @post.user != current_user
    return render_not_found if @post.blank?

    @post.update_attributes(post_params)
    redirect_to subcommunities_path
  end

  def destroy
    @post = Post.find(params[:id])
    return render_forbidden if @post.user != current_user
    return render_not_found if @post.blank?
    @post.destroy
    redirect_to subcommunities_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :description)
  end
end
