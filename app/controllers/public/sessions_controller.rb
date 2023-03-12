# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :end_user_state, only: [:create]
  
  protected
  #退会しているかを判断するメソッド
  def end_user_state
    ## 【処理内容1】 入力されたemailからアカウントを1件取得
    @end_user = EndUser.find_by(email: params[:end_user][:email])
    ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@end_user
    ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別 &&
    ## 【処理内容3】アカウントのis_deletedカラムに格納されている値を確認し、遷移先を決定
    if @end_user.valid_password?(params[:end_user][:password]) && !@end_user.is_deleted == false
    # 【処理内容3-1】is_deletedがtrueなら退会しているのでサインアップ画面に遷移
      redirect_to new_end_user_registration_path
    # 【処理内容3-2】is_deletedがfalseなら退会していないのでそのままcreateアクション(ログイン)を実行
    end
  end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end



  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
