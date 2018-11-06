class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.string :user_id
      t.string :blog_title
      t.string :blog_url
      t.string :blog_description

      t.timestamps
    end
  end
end
