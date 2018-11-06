class Category < ApplicationRecord
    has_many :relationship_categories, dependent: :destroy
    has_many :subject_post, through: :relationship_categories, source: :post

    validates :name, presence: true
    #def posts
        #return Post.where(category: "簡単")
    #end

end
