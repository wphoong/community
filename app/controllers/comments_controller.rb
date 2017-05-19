class CommentsController < ApplicationController

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
    @comment.update_attributes(comment_params)

    redirect_to subcommunity_post_path(@subcom, @post)
  end

  def destroy
    @subcom = Subcommunity.find(params[:subcommunity_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to subcommunity_post_path(@subcom, @post)
  end

  private

  def comment_params
    params.require(:comment).permit(:message)
  end

end
