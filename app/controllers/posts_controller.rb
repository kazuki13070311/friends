class PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path, notice: '投稿が完了しました。'
    else
      redirect_to posts_path, notice: '投稿できませんでした。全項目入力してください。 '
    end
      
      #redirect_back(fallback_location: root_path)
    #else
      #redirect_back(fallback_location: root_path)
    #end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: '募集内容を削除しました。'
  end

  private

  def post_params
    params.require(:post).permit(:image,:remove_image)
  end
end
