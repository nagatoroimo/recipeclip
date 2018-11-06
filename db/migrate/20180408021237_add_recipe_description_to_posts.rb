class AddRecipeDescriptionToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :recipe_description, :text
  end
end
