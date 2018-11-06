class AddTimeToNotices < ActiveRecord::Migration[5.1]
  def change
    add_column :notices, :time, :string
  end
end
