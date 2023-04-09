class Public::PostCommentsController < ApplicationController
  before_action :authenticate_end_user!

  def create
    @post_machineko = PostMachineko.find(params[:post_machineko_id])
    @post_comment = current_end_user.post_comments.new(post_comment_params)
    @post_comment.post_machineko_id = @post_machineko.id
    @post_comment.save
    # redirect_to post_machineko_path(post_machineko)
  end

  def destroy
    PostComment.find(params[:id]).destroy
    @post_machineko = PostMachineko.find(params[:post_machineko_id])
    @post_comment = PostComment.new
    # redirect_to request.referer
  end

private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
