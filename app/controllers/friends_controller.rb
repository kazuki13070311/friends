class FriendsController < ApplicationController
  def index
    @friends = Friend.all
  end

  def show
    @friend = Friend.find(params[:id])
  end

  def new
    @friend = Friend.new
  end

  def edit
    @friend = Friend.find(params[:id])
  end

  def update
    friend = Friend.find(params[:id])
    friend.update!(friend_params)
    redirect_to friends_url, notice: "フレンド募集内容の更新が完了しました。"
  end

  def destroy
    friend = Friend.find(params[:id])
    friend.destroy
    redirect_to friends_url,notice: "募集内容を削除しました。"
  end

  def create
    @friend = Friend.new(friend_params)
    
    if @friend.save
      redirect_to @friend, notice: "フレンド募集の投稿が完了しました。"
    else
      render :new
    end
  end

  private

  def friend_params
    params.require(:friend).permit(:name,:description)
  end
end
