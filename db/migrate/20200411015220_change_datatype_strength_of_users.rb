class ChangeDatatypeStrengthOfUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :strength,:float
  end
end
