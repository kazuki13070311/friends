# frozen_string_literal: true

# == Schema Information
#
# Table name: friends
#
#  id          :bigint           not null, primary key
#  description :text(65535)
#  model       :string(255)
#  name        :string(30)       not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
require 'rails_helper'

RSpec.describe Friend, type: :model do
end
