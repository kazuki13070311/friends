class Post < ApplicationRecord
  validates :content, presence: true 
  validates :image, presence: true
  validates :description, presence: true
  validate :add_error_sample

  belongs_to :user
  has_many :likes,dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  mount_uploader :image, ImageUploader

  def self.create_all_ranks
    Post.find(Like.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
  end

  def add_error_sample
    if content.empty?
      errors.add(:content, "に関係するエラーを追加")
      errors[:base] << "モデル全体に関係するエラーを追加"
    end
  end
end
