class CreateMicroposts < ActiveRecord::Migration[6.0]
  def change
    create_table :microposts do |t|
      t.string :model, null: false
      t.string :content, null: false
      t.string :name_type, null: false
      t.string :raid_time
      t.text :description, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
