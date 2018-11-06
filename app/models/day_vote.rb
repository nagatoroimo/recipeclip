class DayVote < ApplicationRecord
  belongs_to :blog

  validates :blog_id, presence: true
end
