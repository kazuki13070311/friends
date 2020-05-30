require 'rails_helper'

RSpec.describe "コメント機能リクエストテスト", type: :request do
  describe 'POST #create' do
    describe 'パラメータが妥当な場合' do
      before do
        @user1 = create(:user1)
        @friend1 = create(:friend, user: @user1)
        @comment1 = create(:comment, friend: @friend1, user: @user1)
        sign_in @user1
      end

      it 'コメントが作成されていること' do
        expect(Comment.last.content).to eq 'MyText'  
      end

      it '投稿詳細ページが表示される' do
        expect(response).to eq nil
      end
    end
  end
end
