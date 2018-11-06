class AddNotifiedUserIdToLikes < ActiveRecord::Migration[5.1]
  def change
    add_column :likes, :notified_user_id, :integer
  end
end
