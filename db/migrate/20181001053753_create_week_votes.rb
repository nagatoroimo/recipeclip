class CreateWeekVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :week_votes do |t|
      t.string :ip
      t.references :blog, foreign_key: true

      t.timestamps
    end
  end
end
