class RelationshipCategory < ApplicationRecord
  belongs_to :post
  belongs_to :temp, optional: true
  belongs_to :category

  validates :post_id, presence: true
  validates :category_id, presence: true
end
