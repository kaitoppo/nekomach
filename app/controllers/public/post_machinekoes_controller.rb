class Public::PostMachinekoesController < ApplicationController
  before_action :authenticate_end_user!, only: [:new, :create, :show]
  before_action :correct_user, only: [:destory]
  
  def new
    @post_machineko = PostMachineko.new
  end
  
  def create
    @post_machineko = PostMachineko.new(post_machineko_params)
    @post_machineko.end_user_id = current_end_user.id
    if @post_machineko.save
      redirect_to post_machinekoes_path
    else
        render :new
    end
  end  
  
  def destroy
    @post_machineko.destroy
    redirect_to post_machinekoes_path
  end
  
  def index
    @post_machinekoes = PostMachineko.all
  end
  
  def show
    @post_machineko = PostMachineko.find(params[:id])
    @post_comment = PostComment.new
  end
  
  def map 
    @post_machinekoes = PostMachineko.all
  end
  
  private
  
  def post_machineko_params
    params.require(:post_machineko).permit(:shot_address, :caption, :image,:latitude, :longitude)
  end
  
  # ログインユーザーが投稿をしているかの判断
  def correct_user
    @post_machineko = current_end_user.post_machinekoes.find_by(id: params[:id])
    redirect_to root_path unless @post_machineko
  end
end