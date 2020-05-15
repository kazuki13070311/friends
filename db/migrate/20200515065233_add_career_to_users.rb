class AddCareerToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :carreer, :string
    add_column :users, :weapon, :string
  end
end
