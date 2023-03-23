class Public::PostCommentsController < ApplicationController
  before_action :authenticate_end_user!
  def create
    post_machineko = PostMachineko.find(params[:post_machineko_id])
    comment = current_end_user.post_comments.new(post_comment_params)
    comment.post_machineko_id = post_machineko.id
    comment.save
    redirect_to post_machineko_path(post_machineko)
  end
  
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
  
end