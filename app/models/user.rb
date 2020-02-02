class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :profile, length: { maximum: 400 }

  has_many :friends
  has_one_attached :image
  
  mount_uploader :image, ImageUploader

  def friends
    return Friend.where(user_id: self.id)
  end
end
