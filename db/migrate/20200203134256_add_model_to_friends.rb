class AddModelToFriends < ActiveRecord::Migration[6.0]
  def change
    add_column :friends, :model, :string
  end
end
