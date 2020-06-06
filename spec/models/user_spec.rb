# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean          default(FALSE)
#  carreer                :string(255)
#  clan                   :string(255)
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  image                  :string(255)
#  level                  :integer
#  lightlevel             :integer
#  model                  :string(255)
#  name                   :string(255)
#  profession             :string(255)
#  profile                :text(65535)
#  psnid                  :string(255)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  sex                    :string(255)
#  steam                  :string(255)
#  strength               :float(24)
#  style                  :string(255)
#  timezone               :string(255)
#  twitter                :string(255)
#  voice                  :string(255)
#  weapon                 :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'rails_helper'

RSpec.describe "Userモデルのテスト", type: :model do
  before do
    @user = User.new(
      name: "テストユーザー",
      email: "test@gmail.com",
      password: "password",
      password_confirmation: 'password',
      profile: "テスト",
    )
  end
  
  it "名前、メール、パスワード、パスワード確認があれば有効な状態である事" do
    expect(@user).to be_valid
  end

  it "名前がなければ無効な状態である事" do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to_not include("空白は無効です")  
  end

  it "重複したメールアドレスなら無効な状態である事" do
    @user = User.new(
        name: "テストユーザー",
        email: "test@gmail.com",
        password: "password",
        password_confirmation: 'password',
    )
    @user.valid?
    expect(@user.errors[:email]).to_not include("すでに使用されています")  
  end

  it "ユーザーの名前がインスタンスを通して表示される" do
   expect(@user.name).to eq "テストユーザー"  
  end

  it "ユーザー名が30文字以上だとエラーになる" do
    user = User.new(name: "あ" * 31)
    user.valid?
    expect(user.errors[:name]).to_not include("30文字以内にしてください")  
  end

  it "プロフィールが400文字以上だとエラーになる" do
    user = User.new(profile: "a" * 401)
    user.valid?
    expect(user.errors[:profile]).to_not include("400文字以内にしてください")  
  end
end
