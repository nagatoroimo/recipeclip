class AddCookingTimeToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :cooking_time, :string
  end
end
