class UsersController < ApplicationController
  def home
    #@user = User.all
  end

  def index
    #@user = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end
end
