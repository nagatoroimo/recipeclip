class CreateCooktimes < ActiveRecord::Migration[5.1]
  def change
    create_table :cooktimes do |t|
      t.string :time

      t.timestamps
    end
  end
end
