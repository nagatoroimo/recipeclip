class Article < ApplicationRecord
    belongs_to :blog
    has_many :week_out_points
end
