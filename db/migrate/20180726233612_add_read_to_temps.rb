class AddReadToTemps < ActiveRecord::Migration[5.1]
  def change
    add_column :temps, :read, :boolean, default: false, null: false
  end
end
