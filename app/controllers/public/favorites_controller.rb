class Public::FavoritesController < ApplicationController
  def create
    post_machineko = PostMachineko.find(params[:post_machineko_id])
    favorite = current_end_user.favorites.new(post_machineko_id: post_machineko.id)
    favorite.save
    redirect_to request.referer #同じページへ遷移
  end
  
  def destroy
    post_machineko = PostMachineko.find(params[:post_machineko_id])
    favorite =current_end_user.favorites.find_by(post_machineko_id: post_machineko.id)
    favorite.destroy
    redirect_to request.referer #同じページへ遷移
  end
end
