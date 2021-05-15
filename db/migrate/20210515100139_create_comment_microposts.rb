class CreateCommentMicroposts < ActiveRecord::Migration[6.0]
  def change
    create_table :comment_microposts do |t|
      t.text :comment
      t.references :micropost, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
