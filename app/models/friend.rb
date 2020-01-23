class Friend < ApplicationRecord
    validates :name, presence: true
    validates :name, length: {maximum: 30}
    validate :validate_name_not_including_comma
    
    belongs_to :user
    #has_many :friends

    def user
      return User.find_by(id: self.user_id)
    end

    private

    def validate_name_not_including_comma
      errors.add(:name,'にカンマを含めることはできません') if name&.include?(',')    
    end
end
