class CreateRelationshipCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :relationship_categories do |t|
      t.references :post, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps

      t.index [:post_id, :category_id]
    end
  end
end
