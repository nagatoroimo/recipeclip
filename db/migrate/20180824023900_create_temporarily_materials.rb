class CreateTemporarilyMaterials < ActiveRecord::Migration[5.1]
  def change
    create_table :temporarily_materials do |t|
      t.integer :temp_id
      t.string :temp_name
      t.string :temp_quantity

      t.timestamps
    end
  end
end
