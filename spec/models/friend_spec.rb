# frozen_string_literal: true

# == Schema Information
#
# Table name: friends
#
#  id          :bigint           not null, primary key
#  description :text(65535)
#  model       :string(255)
#  name        :string(30)       not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
require 'rails_helper'

RSpec.describe Friend, type: :model do
  before do
    user = create(:user)
    @friend = Friend.new(
        model: "PS4",
        name: "フレンド募集",
        description: "テスト",
        user: user,
    )
  end

  it "機種名、募集内容、詳細があれば有効であること" do
    expect(@friend).to be_valid  
  end

  it "詳細が未記入なら無効な状態である" do
    friend = Friend.new(description: nil)
    friend.valid?
    expect(friend.errors[:description]).to_not include("空白は無効です")  
  end

  it "募集内容がインスタンスを通じて表示される" do
    expect(@friend.name).to eq "フレンド募集"  
  end
end
