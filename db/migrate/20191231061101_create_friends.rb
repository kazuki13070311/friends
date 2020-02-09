# frozen_string_literal: true

class CreateFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :friends do |t|
      t.string :name, limit: 30, null: false
      t.text :description

      t.timestamps
    end
  end
end
