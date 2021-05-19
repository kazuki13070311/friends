class CommentMicropostsController < ApplicationController

  def create
    @micropost = Micropost.find(params[:micropost_id])
    @comment_micropost = @micropost.comment_microposts.build(comment_micropost_params)
    @comment_micropost.user_id = current_user.id
    if @comment_micropost.save
      render :index
    end
  end

  def destroy
    @comment_micropost = CommentMicropost.find(params[:id])
    @comment_micropost.destroy
    render :index
  end

  private

  def comment_micropost_params
    params.require(:comment_micropost).permit(:comment, :micropost_id, :user_id)
  end
end
