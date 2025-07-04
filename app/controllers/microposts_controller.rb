class MicropostsController < ApplicationController
  before_action :login_check, only: %i[new edit update destroy]
  before_action :currect_user, only: %i[edit update]

  def index
    @microposts = Micropost.all.page(params[:page]).per(10).order(updated_at: :desc)
    @q = @microposts.ransack(params[:q])
    @microposts = @q.result(distinct: true)
  end

  def show
    @micropost = Micropost.find(params[:id])
    @user = @micropost.user
    @comment_micropost = CommentMicropost.new
    @comment_microposts = @micropost.comment_microposts
    impressionist(@user, nil, :unique => [:session_hash])
    @page_views = @user.impressionist_count
  end

  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = Micropost.new(micropost_params)
    @micropost.user_id = current_user.id
    if @micropost.save
      redirect_to @micropost, notice: '投稿が完了しました。'
    else
      render :new
    end
  end

  def edit
    @micropost = Micropost.find(params[:id])
  end

  def update
    micropost = Micropost.find(params[:id])
    micropost.update!(micropost_params)
    redirect_to micropost_path, notice: '募集内容の更新が完了しました。' 
  end

  def destroy
    micropost = Micropost.find(params[:id])
    micropost.destroy
    redirect_to microposts_url, notice: '募集内容を削除しました。' 
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content, :description, :model, :name_type, :raid_time)
  end

  def login_required
    redirect_to login_url unless current_user
  end

  def login_check
    unless user_signed_in?
      redirect_to new_user_session_path, notice: 'ログインしてください'
    end
  end

  def currect_user
    micropost = Micropost.find(params[:id])
    unless user_signed_in? && micropost.user.id == current_user.id
      redirect_to micropost, notice: '他ユーザーの投稿は編集できません'
    end
  end

  def user_logged_in?
    !current_user.nil?
  end
end
