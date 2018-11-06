class AddRecipeStepToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :recipe_step, :text, array: true
  end
end
