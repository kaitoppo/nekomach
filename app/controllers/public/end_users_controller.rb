class Public::EndUsersController < ApplicationController
before_action :authenticate_end_user!
  def show
    @end_user = current_end_user
    @post_machinekoes = @end_user.post_machinekoes.order(created_at: :desc)
  end

  def edit
    @end_user = current_end_user
  end

  def update
    @end_user = current_end_user
    if @end_user.update(end_user_params)
      redirect_to end_users_my_page_path
    else
      @end_user = current_end_user
      render "edit"
    end
  end

  def withdrawal #退会機能
    @end_user = current_end_user
    if @end_user.update(is_deleted: true)
      reset_session
      flash[:notice] = "退会しました"
      redirect_to root_path
    end
  end

  private

  def end_user_params
    params.require(:end_user).permit(:nick_name, :profile_image)
  end

end