# frozen_string_literal: true

class UsersController < ApplicationController
  def home; end

  def index
    @users = User.all.page(params[:page]).per(9).order(created_at: :desc)
    @q = @users.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  def show
    @user = User.find(params[:id])
    @friends = @user.friends
    @relationship = Relationship.new
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

  def friend
    @user = User.find(params[:id])
    @friends = @user.friends.page(params[:page]).per(10).order(updated_at: :desc)
  end

  def post
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(6).order(updated_at: :desc)
  end

  def like
    @user = User.find(params[:id])
    @likes = @user.likes.page(params[:page]).per(6).order(updated_at: :desc)
  end

  def following
    @user = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

  private

  def user_params
    params[:user].permit(:email)
  end

  def user_params
    params.require(:user).permit(:name, :email, :profile, :profession, :image, :strength, :image_cache)
  end
end
