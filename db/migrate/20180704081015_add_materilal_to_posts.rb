class AddMaterilalToPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :material, :text, array: true
  end
end
