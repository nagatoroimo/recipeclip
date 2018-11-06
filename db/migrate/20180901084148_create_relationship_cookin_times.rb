class CreateRelationshipCookinTimes < ActiveRecord::Migration[5.1]
  def change
    create_table :relationship_cookin_times do |t|
      t.references :post, foreign_key: true
      t.references :cooktime, foreign_key: true

      t.timestamps

      t.index [:post_id, :cooktime_id]
    end
  end
end
