class CreateDayInPoints < ActiveRecord::Migration[5.1]
  def change
    create_table :day_in_points do |t|
      t.string :ip
      t.references :blog, foreign_key: true

      t.timestamps
    end
  end
end
