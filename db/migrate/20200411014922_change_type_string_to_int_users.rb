class ChangeTypeStringToIntUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :strength,:string
  end
end
