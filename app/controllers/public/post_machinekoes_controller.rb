class Public::PostMachinekoesController < ApplicationController
  
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
  
  def index
    @post_machinekoes = PostMachineko.all
  end
  
  def show
    @post_machineko = PostMachineko.find(params[:id])
  end
  
  def map 
    @post_machinekoes = PostMachineko.all
  end
  
  private
  
  def post_machineko_params
    params.require(:post_machineko).permit(:shot_address, :caption, :image,:latitude, :longitude)
  end
end