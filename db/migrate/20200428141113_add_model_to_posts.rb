class AddModelToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :post_image, :string
  end
end
