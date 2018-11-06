class RecipeStep < ApplicationRecord
    belongs_to :post
    belongs_to :temp, optional: true

    validates :post_id, presence: true
    validates :step, presence: true, length: { maximum:100 }
end
