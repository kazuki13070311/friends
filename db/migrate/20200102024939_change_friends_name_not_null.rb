class ChangeFriendsNameNotNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null :friends, :name,false
  end
end
