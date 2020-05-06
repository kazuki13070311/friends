# == Schema Information
#
# Table name: messages
#
#  id         :bigint           not null, primary key
#  document   :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Message < ApplicationRecord
  validates :document, presence: true
  after_create_commit { MessageBroadcastJob.perform_later self}
end
