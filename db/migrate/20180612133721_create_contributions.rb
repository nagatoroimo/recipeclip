class CreateContributions < ActiveRecord::Migration[5.1]
  def change
    create_table :contributions do |t|
      t.string :user_id
      t.string :post_id
      t.text :contribution

      t.timestamps
    end
  end
end
