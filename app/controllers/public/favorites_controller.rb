class Public::FavoritesController < ApplicationController
  before_action :authenticate_end_user!

  def create
    @post_machineko = PostMachineko.find(params[:post_machineko_id])
    current_end_user.favorites.find_or_create_by(post_machineko_id: @post_machineko.id)
    # redirect_to request.referer #同じページへ遷移
  end

  def destroy
    @post_machineko = PostMachineko.find(params[:post_machineko_id])
    favorite = current_end_user.favorites.find_by(post_machineko_id: @post_machineko.id)
    favorite.destroy if favorite
    # redirect_to request.referer #同じページへ遷移
  end

  def index
    favorites = Favorite.where(end_user_id: current_end_user.id).pluck(:post_machineko_id)
    @post_machinekoes = Kaminari.paginate_array(PostMachineko.order(created_at: :desc).find(favorites)).page(params[:page])
  end
end