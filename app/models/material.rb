class Material < ApplicationRecord
    belongs_to :post
    belongs_to :temp, optional: true

    validates :post_id, presence: true
    validates :name, presence: true, length: { maximum: 20}
    validates :quantity, presence: true, length: { maximum: 10}
end
