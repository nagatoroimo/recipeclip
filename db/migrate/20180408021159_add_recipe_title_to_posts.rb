class AddRecipeTitleToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :recipe_title, :string
  end
end
