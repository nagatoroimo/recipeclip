class DayInPoint < ApplicationRecord
  belongs_to :blog

  validates :blog_id, presence: true

  def self.ranking
    self.group(:blog_id).order("count_blog_id DESC").limit(4).count(:blog_id)
  end
end
