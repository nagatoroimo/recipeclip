class AddVisualImageNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :visual_image_name, :string
  end
end
