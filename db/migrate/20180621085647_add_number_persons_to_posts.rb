class AddNumberPersonsToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :number_persons, :string
  end
end
