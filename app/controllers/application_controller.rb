class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception

  before_action :set_current_user,only:[:create]
  before_action :configure_permitted_parameters, if: :devise_controller?
  #bifore_action :authenticate_user!
  #ログイン後のリダイレクト先
  def after_sing_in_path_for(resource)
    friends_path
    blogs_path
    #"/user/#{current_user.id}"
  end

  def set_current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end

  protected

  #入力フォームからアカウント名情報をDBに保存するために追加
  def configure_permitted_parameters

    # sign_upのときに、nameをストロングパラメータに追加する
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) # 新規登録時(sign_up時)にnameというキーのパラメーターを追加で許可する
    
    # account_updateのときに、name,email,profileをストロングパラメータに追加する
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :profile])
  end
end
