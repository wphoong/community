class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @subcom = Subcommunity.find(params[:subcommunity_id])
    @post = Post.find(params[:post_id])
    @post.comments.create(comment_params.merge(user: current_user))

    redirect_to subcommunity_post_path(@subcom, @post)
  end

  def update
    @subcom = Subcommunity.find(params[:subcommunity_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    return render_not_found if @comment.blank?
    return render_forbidden if @comment.user != current_user
    @comment.update_attributes(comment_params)

    redirect_to subcommunity_post_path(@subcom, @post)
  end

  def destroy
    @subcom = Subcommunity.find(params[:subcommunity_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    return render_not_found if @comment.blank?
    return render_forbidden if @comment.user != current_user
    @comment.destroy
    redirect_to subcommunity_post_path(@subcom, @post)
  end

  private

  def comment_params
    params.require(:comment).permit(:message)
  end
end
