class Admin::EndUsersController < ApplicationController
  def index
    @end_users = EndUser.all.order(created_at: :desc).page(params[:page])
  end

  def show
    @end_user = EndUser.find(params[:id])
    @post_machinekoes = @end_user.post_machinekoes.order(created_at: :desc).page(params[:page])
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end
  
  def update
    @end_user = EndUser.find(params[:id])
    if @end_user.update!(end_user_params)
       redirect_to admin_end_user_path(@end_user), notice: "情報を更新しました"
    else
      render :edit 
    end
  end

  private
  
  def end_user_params
    params.require(:end_user).permit(:nick_name, :profile_image, :telephone_number, :is_deleted)
  end
end