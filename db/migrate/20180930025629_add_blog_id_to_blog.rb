class AddBlogIdToBlog < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :blog_id, :integer
  end
end
