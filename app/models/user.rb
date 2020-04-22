# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :profile, length: { maximum: 400 }

  has_many :posts, dependent: :destroy
  has_many :friends, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  has_one_attached :image, dependent: :destroy

  mount_uploader :image, ImageUploader

  def friends
    Friend.where(user_id: id)
  end

  def already_liked?(post)
    likes.exists?(post_id: post.id)
  end

  def self.guest
    find_or_create_by!(name: 'ゲストユーザー', email: 'test123@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
