class TemporarilyMaterial < ApplicationRecord
    belongs_to :temp

    validates :temp_id, presence: true
    validates :temp_name, presence: true
    validates :temp_quantity, presence: true
end
