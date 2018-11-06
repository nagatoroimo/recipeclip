class AddBlogIdToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :blog_id, :string
  end
end
