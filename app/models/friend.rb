# frozen_string_literal: true

class Friend < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { maximum: 30 }
  validate :validate_name_not_including_comma
  validates :description, presence: true
  validates :description, length: { maximum: 400 }

  belongs_to :user

  private

  def validate_name_not_including_comma
    errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
  end
end
