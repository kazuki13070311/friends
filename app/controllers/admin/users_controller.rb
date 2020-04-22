# frozen_string_literal: true

class Admin::UsersController < ApplicationController
  before_action :admin_user

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'User deleted'
    redirect_to root_path, notice: 'アカウントを削除しました。'
  end

  private

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
end
