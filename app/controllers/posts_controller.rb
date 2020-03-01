class PostsController < ApplicationController
  before_action :login_required, only: [:edit,:new]

  def index
    @post = Post.new
    @posts = Post.all.page(params[:page]).per(9)
    @q = @posts.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
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
    params.require(:post).permit(:content,:image, :description)
  end

  def login_required
    redirect_to login_url unless current_user
  end

end
