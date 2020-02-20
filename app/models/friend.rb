# frozen_string_literal: true

# == Schema Information
#
# Table name: friends
#
#  id          :integer          not null, primary key
#  description :text
#  model       :string
#  name        :string(30)       not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#


class Friend < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { maximum: 30 }
  validate :validate_name_not_including_comma
  validates :description, presence: true

  belongs_to :user
  #has_many :friend

  # def user
  # return User.find_by(id: self.user_id)
  # end

  private

  def validate_name_not_including_comma
    errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
  end
end
