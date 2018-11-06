class WeekOutPoint < ApplicationRecord
  belongs_to :article
  belongs_to :blog

  validates :article_id, presence: true
  validates :blog_id, presence: true
end
