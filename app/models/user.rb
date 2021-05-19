# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean          default(FALSE)
#  carreer                :string(255)
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
#  steam                  :string(255)
#  strength               :float(24)
#  style                  :string(255)
#  timezone               :string(255)
#  twitter                :string(255)
#  voice                  :string(255)
#  weapon                 :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :name, length: { maximum: 30 }
  validates :profile, length: { maximum: 400 }

  has_many :posts, dependent: :destroy
  has_many :friends, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  has_many :comments, dependent: :destroy  
  has_many :following_relationships,foreign_key: "follower_id", class_name: "Relationship",dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship",dependent: :destroy
  has_many :followers,through: :follower_relationships
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  has_many :microposts, dependent: :destroy
  has_many :comment_microposts, dependent: :destroy

  has_one_attached :image, dependent: :destroy

  mount_uploader :image, ImageUploader

  def friends
    Friend.where(user_id: id)
  end

  def already_liked?(post)
    likes.exists?(post_id: post.id)
  end

  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end

  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end

  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end

  def self.guest
    find_or_create_by!(name: 'ゲストユーザー', email: 'test123@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def create_notification_follow!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ",current_user.id, id, 'follow'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end
end
