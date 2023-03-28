class Public::PostMachinekoesController < ApplicationController
  before_action :authenticate_end_user!, only: [:new, :create, :show]

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
    @post_machinekoes = PostMachineko.order(created_at: :desc).page(params[:page])
  end

  def show
    @post_machineko = PostMachineko.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @post_machineko = PostMachineko.find(params[:id])
  end

  def update
    @post_machineko = PostMachineko.find(params[:id])
    if @post_machineko.update(post_machineko_params)
      redirect_to post_machineko_path(@post_machineko)
    else
      render root_path
    end
  end

  def destroy
    @post_machineko = PostMachineko.find(params[:id])
    @post_machineko.destroy
    redirect_to post_machinekoes_path
  end

  def search
    if params[:keyword].present?
      @post_machinekoes = PostMachineko.where('caption like ? ', "%#{params[:keyword]}%").or(PostMachineko.where('shot_address like ? ', "%#{params[:keyword]}%"))
      @keyword = params[:keyword]
    else
      @post_machinekoes = PostMachineko.all
    end
  end

  def map
    @post_machinekoes = PostMachineko.all
  end

  private

  def post_machineko_params
    params.require(:post_machineko).permit(:shot_address, :caption, :image,:latitude, :longitude)
  end

end