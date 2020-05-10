class HomesController < ApplicationController

  def home
    @friends = Friend.all.page(params[:page]).per(3).order(updated_at: :desc)
    @posts = Post.all.page(params[:page]).per(3).order(updated_at: :desc)
  end
end
