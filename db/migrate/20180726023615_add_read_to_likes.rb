class AddReadToLikes < ActiveRecord::Migration[5.1]
  def change
    add_column :likes, :read, :boolean, default: false, null: false
  end
end
