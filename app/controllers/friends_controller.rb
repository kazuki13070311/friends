# frozen_string_literal: true

class FriendsController < ApplicationController
  before_action :login_check, only: %i[new edit update destroy]
  before_action :correct_user, only: %i[edit update]
  impressionist unique: [:session_hash]

  def index
    @friends = Friend.all.page(params[:page]).per(10).order(updated_at: :desc)
    @user = User.all
    @q = @friends.ransack(params[:q])
    @friends = @q.result(distinct: true)
  end

  def show
    @friend = Friend.find(params[:id])
    @user = @friend.user
    @comment = Comment.new
    @comments = @friend.comments.order(created_at: :asc)
    impressionist(@user, nil, :unique => [:session_hash])
    @page_views = @user.impressionist_count
  end

  def new
    @friend = Friend.new
  end

  def edit
    @friend = Friend.find(params[:id])
  end

  def update
    friend = Friend.find(params[:id])
    friend.update!(friend_params)
    redirect_to friends_url, notice: '募集内容の更新が完了しました。'
  end

  def destroy
    friend = Friend.find(params[:id])
    friend.destroy
    redirect_to friends_url, notice: '募集内容を削除しました。'
  end

  def create
    @friend = Friend.new(friend_params)
    @friend.user_id = current_user.id

    if @friend.save
      redirect_to @friend, notice: 'フレンド募集の投稿が完了しました。'
    else
      render :new
    end
  end

  private

  def friend_params
    params.require(:friend).permit(:name, :description, :email, :model)
  end

  def login_required
    redirect_to login_url unless current_user
  end

  def login_check
    unless user_signed_in?
      redirect_to new_user_session_path, notice: 'ログインしてください'
    end
  end

  def correct_user
    friend = Friend.find(params[:id])
    unless user_signed_in? && friend.user.id == current_user.id
      redirect_to friend, notice: '他ユーザーの投稿は編集できません'
    end
  end

  def user_logged_in?
    !current_user.nil?
  end
end
