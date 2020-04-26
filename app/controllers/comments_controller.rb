class CommentsController < ApplicationController

  def create
    @friend = Friend.find(params[:friend_id])
    @comment = @friend.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    render :index
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render :index
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :friend_id, :user_id)
  end
end
