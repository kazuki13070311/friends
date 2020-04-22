# frozen_string_literal: true

class AddStrengthToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :strength, :integer
  end
end
