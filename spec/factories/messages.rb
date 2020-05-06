# == Schema Information
#
# Table name: messages
#
#  id         :bigint           not null, primary key
#  document   :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :message do
    document { "MyText" }
  end
end
