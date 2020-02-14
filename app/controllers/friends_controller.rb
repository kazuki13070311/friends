# frozen_string_literal: true

class FriendsController < ApplicationController
  before_action :login_required, only: [:edit,:new]

  def index
    @friends = Friend.all.page(params[:page]).per(10)
    @user = User.all
    @q = @friends.ransack(params[:q])
    @friends = @q.result(distinct: true)
    #@user = User.find(current_user.id).image
  end

  def show
    @friend = Friend.find(params[:id])
    @user = @friend.user
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
    redirect_to friends_url, notice: 'フレンド募集内容の更新が完了しました。'
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
end
