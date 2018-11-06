class Cooktime < ApplicationRecord
    has_many :relationship_cookin_times, dependent: :destroy
    has_many :subject_post, through: :relationship_cookin_times, source: :post

    validates :time, presence: true
end
