class AddReadToFollow < ActiveRecord::Migration[5.1]
  def change
    add_column :follows, :read, :boolean, default: false, null: false
  end
end
