# frozen_string_literal: true

class UsersController < ApplicationController

  def home
    # @user = User.all
  end

  def index
    @users = User.all.page(params[:page]).per(9)
    @q = @users.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  def show
    @user = User.find(params[:id])
    @friends = @user.friends
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to root_path, notice: 'プロフィールを更新しました。'
    else
      render :edit
    end

  end

  private

  def user_params
    params[:user].permit(:email)
  end

  def user_params
    params.require(:user).permit(:name, :email, :profile, :image, :kd)
  end

end
