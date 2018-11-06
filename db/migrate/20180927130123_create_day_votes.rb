class CreateDayVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :day_votes do |t|
      t.string :ip
      t.references :blog, foreign_key: true
      #実際のデータベース上では、 blog_id カラムとして存在する

      t.timestamps
    end
  end
end
