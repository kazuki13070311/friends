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
FactoryBot.define do
  factory :comment do
    content { "MyText" }
    user_id { 1 }
    friend_id { 1 }
  end
end
