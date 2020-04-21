class Post < ApplicationRecord
  validates :content, presence: true 
  validates :content, length: { maximum: 30 }
  validates :image, presence: true
  validates :description, presence: true
  validates :description, length: { maximum: 400 }

  belongs_to :user
  has_many :likes,dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  mount_uploader :image, ImageUploader

  def self.create_all_ranks
    Post.find(Like.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
  end
end
