class AddContentToContributions < ActiveRecord::Migration[5.1]
  def change
    add_column :contributions, :content, :text
  end
end
