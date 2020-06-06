# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  content    :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  friend_id  :integer
#  user_id    :integer
#
require 'rails_helper'

RSpec.describe "Commentモデルのテスト", type: :model do
  before do
    user = create(:user)
    @comment = Comment.new(
        content: "テスト投稿",
        user: user,
    )
  end

  it "コメント内容がインスタンスを通じて表示される" do
    expect(@comment.content).to eq "テスト投稿"  
  end
end
