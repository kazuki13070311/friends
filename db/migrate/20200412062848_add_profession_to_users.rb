# frozen_string_literal: true

class AddProfessionToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :profession, :string
  end
end
