class AddNotifiedUserIdToFollow < ActiveRecord::Migration[5.1]
  def change
    add_column :follows, :notified_user_id, :integer
  end
end