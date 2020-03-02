class Post < ApplicationRecord
  validates :content, presence: true 
  validates :image, presence: true
  validates :description, presence: true

  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  mount_uploader :image, ImageUploader

end
