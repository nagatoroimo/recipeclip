class AddPostIdToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :post_id, :integer
  end
end
