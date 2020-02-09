# frozen_string_literal: true

class AddClanToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :clan, :string
    add_column :users, :psnid, :string
  end
end
