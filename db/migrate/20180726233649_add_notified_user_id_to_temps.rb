class AddNotifiedUserIdToTemps < ActiveRecord::Migration[5.1]
  def change
    add_column :temps, :notified_user_id, :integer
  end
end
