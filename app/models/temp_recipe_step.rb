class TempRecipeStep < ApplicationRecord
    belongs_to :temp

    validates :temp_id, presence: true
    validates :step, presence: true
end
