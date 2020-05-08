# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean          default(FALSE)
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
#  strength               :float(24)
#  style                  :string(255)
#  timezone               :string(255)
#  twitter                :string(255)
#  voice                  :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
FactoryBot.define do
  factory :user do
    name { 'テストユーザー' }
    email { 'test@gmail.com' }
    image { 'default.jpg' }
    sex { '男性' }
    model { 'PS4' }
    profession { 'タイタン' }
    clan { 'sample clan' }
    level { '50' }
    lightlevel { '1000' }
    strength { '2.0' }
    voice { 'あり' }
    style { 'エンジョイ勢(PvP派)' }
    timezone { '21時〜24時' }
    profile { 'どうもこんにちは！' }
    password { 'password' }
    password_confirmation { 'password' }
  end

  factory :user1, class: User do
    name { 'テストユーザー1' }
    email { 'test1@gmail.com' }
    image { 'default.jpg' }
    sex { '女性' }
    model { 'PS3' }
    profession { 'ハンター' }
    clan { 'test clan' }
    level { '30' }
    lightlevel { '100' }
    strength { '2.5' }
    voice { 'あり' }
    style { 'エンジョイ勢(PvP派)' }
    timezone { '21時〜24時' }
    profile { 'どうもこんにちは！' }
    password { 'password' }
    password_confirmation { 'password' }
    trait :invalid do
      name nil
    end
  end

  factory :user2, class: User do
    name { 'テストユーザー2' }
    email { 'test2@gmail.com' }
    image { 'default.jpg' }
    sex { '男性' }
    model { 'PC' }
    profession { 'ウォーロック' }
    clan { 'test1 clan' }
    level { '20' }
    lightlevel { '200' }
    strength { '3.5' }
    voice { 'あり' }
    style { 'エンジョイ勢(PvP派)' }
    timezone { '21時〜24時' }
    profile { 'どうもこんにちは！' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
