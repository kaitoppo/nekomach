class Admin::PostCommentsController < ApplicationController
  
  def index
    @post_comments = PostComment.order(created_at: :desc).page(params[:page])
  end
  
  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to request.referer
  end
  
end