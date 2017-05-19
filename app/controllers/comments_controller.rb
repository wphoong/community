class CommentsController < ApplicationController

  def create
    @subcom = Subcommunity.find(params[:subcommunity_id])
    @post = Post.find(params[:post_id])
    @post.comments.create(comment_params)

    redirect_to subcommunity_post_path(@subcom, @post)
  end

  private

  def comment_params
    params.require(:comment).permit(:message)
  end

end
