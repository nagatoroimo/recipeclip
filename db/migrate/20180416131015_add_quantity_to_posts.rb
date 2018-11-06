class AddQuantityToPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :quantity, :text
  end
end
