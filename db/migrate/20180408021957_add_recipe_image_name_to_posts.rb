class AddRecipeImageNameToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :recipe_image_name, :string
  end
end
