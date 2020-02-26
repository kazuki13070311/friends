class PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
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

      #redirect_back(fallback_location: root_path)
    #else
      #redirect_back(fallback_location: root_path)
    #end
  end

  def update
    post = Post.find(params[:id])
    post.update!(post_params)
    redirect_to post_url, notice: '投稿内容の更新が完了しました。'
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: '募集内容を削除しました。'
  end

  private

  def post_params
    params.permit(:content, :image, :remove_image, :description)
  end
end
