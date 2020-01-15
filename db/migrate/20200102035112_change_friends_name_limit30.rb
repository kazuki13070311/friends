class ChangeFriendsNameLimit30 < ActiveRecord::Migration[6.0]
  def up
    change_column :friends, :name, :string, limit: 30
  end

  def down
    change_column :friends, :name, :string
  end
end
