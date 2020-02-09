# frozen_string_literal: true

class AddUserIdToFriends < ActiveRecord::Migration[6.0]
  def change
    add_column :friends, :user_id, :integer
  end
end
