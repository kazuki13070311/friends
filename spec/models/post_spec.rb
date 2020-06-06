# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id          :bigint           not null, primary key
#  content     :string(255)
#  description :text(65535)
#  image       :string(255)
#  post_image  :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe "Postモデルのテスト", type: :model do
  before do
    user = create(:user)
    @post = Post.new(
        content: "テスト",
        description: "テスト投稿",
        image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test_image.jpg'), 'image/jpg'),
        user: user,
    )
  end

  it "タイトル、投稿内容、投稿画像があれば有効なこと" do
    expect(@post).to be_valid  
  end

  it "タイトルが未記入なら無効な状態である" do
    post = Post.new(content: nil)
    post.valid?
    expect(post.errors[:content]).to_not include("空白は無効です")  
  end

  it "投稿内容が未記入なら無効な状態である" do
    post = Post.new(description: nil)
    post.valid?
    expect(post.errors[:description]).to_not include("空白は無効です")  
  end

  it "投稿画像が未設定なら無効な状態である" do
    post = Post.new(image: nil)
    post.valid?
    expect(post.errors[:image]).to_not include("未設定は無効です")  
  end

  it "タイトル名がインスタンスを通じて表示される" do
    expect(@post.content).to eq "テスト"  
  end
end
