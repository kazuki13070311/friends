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
class Post < ApplicationRecord
  validates :content, presence: true
  validates :content, length: { maximum: 30 }
  validates :image, presence: true
  validates :description, presence: true
  validates :description, length: { maximum: 400 }

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  mount_uploader :image, ImageUploader

  def self.create_all_ranks
    Post.find(Like.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
  end
end
