class CreateTempRecipeSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :temp_recipe_steps do |t|
      t.integer :temp_id
      t.string :step

      t.timestamps
    end
  end
end
