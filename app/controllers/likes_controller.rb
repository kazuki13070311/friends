# frozen_string_literal: true

class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    like = current_user.likes.create(post_id: params[:post_id])
    if like.save
      @post.create_notification_like!(current_user)
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    like.destroy
  end
end
