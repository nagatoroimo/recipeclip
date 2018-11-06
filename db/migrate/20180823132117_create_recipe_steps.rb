class CreateRecipeSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :recipe_steps do |t|
      t.integer :post_id
      t.string :step

      t.timestamps
    end
  end
end
