class AddRssUrlToBlog < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :rss_url, :string
  end
end
