class AddStrengthToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :strength, :string
  end
end
