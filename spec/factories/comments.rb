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
  factory :comment, class: Comment do
    content { "MyText" }
    user {friend.user}
  end
end
