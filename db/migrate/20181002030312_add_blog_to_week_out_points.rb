class AddBlogToWeekOutPoints < ActiveRecord::Migration[5.1]
  def change
    add_reference :week_out_points, :blog, foreign_key: true
  end
end
