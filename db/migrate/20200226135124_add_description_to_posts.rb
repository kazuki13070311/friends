# frozen_string_literal: true

class AddDescriptionToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :description, :text
  end
end
