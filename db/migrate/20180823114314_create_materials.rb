class CreateMaterials < ActiveRecord::Migration[5.1]
  def change
    create_table :materials do |t|
      t.integer :post_id
      t.string :name
      t.string :quantity

      t.timestamps
    end
  end
end
