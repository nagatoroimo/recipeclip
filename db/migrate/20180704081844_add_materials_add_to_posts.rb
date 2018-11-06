class AddMaterialsAddToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :material, :text, array: true
  end
end
