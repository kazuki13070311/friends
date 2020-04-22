# frozen_string_literal: true

class AddImageToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :image, :string
  end
end
