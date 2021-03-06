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
FactoryBot.define do
  factory :friend, class: Friend do
    name { 'フレンド募集' }
    model { 'PS4' }
    description { 'テスト投稿' }
    user
    trait :invalid do
      description nil
    end
  end
end
