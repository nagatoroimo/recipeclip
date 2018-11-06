class RelationshipCookinTime < ApplicationRecord
  belongs_to :post
  belongs_to :temp, optional: true
  belongs_to :cooktime

  validates :post_id, presence: true
  validates :cooktime_id, presence: true
end
