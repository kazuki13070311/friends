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
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :friend

  validates :content, presence: true
end
