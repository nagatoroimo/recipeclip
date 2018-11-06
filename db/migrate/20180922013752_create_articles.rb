class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.datetime :published
      t.text :content
      t.string :url
      t.string :author
      t.integer :feed_id

      t.timestamps
    end
  end
end
