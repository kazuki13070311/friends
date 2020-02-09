# frozen_string_literal: true

class AddSexToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :sex, :string
    add_column :users, :level, :integer
    add_column :users, :lightlevel, :integer
    add_column :users, :model, :string
    add_column :users, :timezone, :string
    add_column :users, :voice, :string
    add_column :users, :style, :string
  end
end
