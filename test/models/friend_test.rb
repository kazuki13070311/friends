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


require 'test_helper'

class FriendTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
