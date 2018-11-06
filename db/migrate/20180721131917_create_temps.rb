class CreateTemps < ActiveRecord::Migration[5.1]
  def change
    create_table :temps do |t|
      t.string :recipe_image_name
      t.string :recipe_title
      t.text :recipe_description
      t.string :category
      t.string :cooking_time
      t.string :number_persons
      t.text :material
      t.text :recipe_step
      t.integer :user_id

      t.timestamps
    end
  end
end
