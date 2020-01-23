class UsersController < ApplicationController
  def home
    #@user = User.all
  end

  def index
    #@user = User.all
  end

  def show
    #@user = User.find_by(id: params[:id])
    @user = User.find(params[:id])
    @friends = @user.friends
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to root_path,notice: "プロフィールを更新しました。"
    else
      render :edit
    end
  end

  private

  def user_params
    params[:user].permit(:email)
  end
end
