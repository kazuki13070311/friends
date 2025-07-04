# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :login_check, only: %i[new edit show update destroy]
  before_action :correct_user, only: %i[edit update]

  def index
    @post = Post.new
    @posts = Post.all.page(params[:page]).per(9).order(updated_at: :desc)
    @q = @posts.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @like = Like.new
    impressionist(@user, nil, :unique => [:session_hash])
    @page_views = @user.impressionist_count
  end

  def ranking
    @all_ranks = Post.create_all_ranks
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path, notice: '投稿が完了しました。'
    else
      render :new
    end
  end

  def update
    post = Post.find(params[:id])

    post.update!(posts_params)
    redirect_to post_url, notice: '投稿内容の更新が完了しました。'
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: '募集内容を削除しました。'
  end

  private

  def post_params
    params.permit(:content, :image, :description)
  end

  def posts_params
    params.require(:post).permit(:content, :image, :description)
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
    post = Post.find(params[:id])
    unless user_signed_in? && post.user.id == current_user.id
      redirect_to post, notice: '他ユーザーの投稿は編集できません'
    end
  end
end
