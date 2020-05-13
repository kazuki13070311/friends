class AddSteamToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :steam, :string
  end
end
