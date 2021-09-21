class CommentsController < ApplicationController

  def create
    @friend = Friend.find(params[:friend_id])
    @comment = @friend.comments.build(comment_params)
    @friends = @comment.friend
    @comment.user_id = current_user.id
    if @comment.save
      @friends.create_notification_comment!(current_user, @comment.id)
      render :index
    end
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
