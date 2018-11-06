class Post < ApplicationRecord
    
    has_many :likes, dependent: :destroy
    has_many :materials, dependent: :destroy
    has_many :recipe_steps, dependent: :destroy

    has_one :relationship_category, dependent: :destroy, class_name: "RelationshipCategory"
    has_one :subject_category, through: :relationship_category, source: :category

    has_one :relationship_cookin_time, dependent: :destroy, class_name: "RelationshipCookinTime"
    has_one :subject_cooking_time, through: :relationship_cookin_time, source: :cooktime
    
    #validates :id, uniqueness: true
    validates :user_id, presence:true
    validates :recipe_image_name, presence: {message:"選択してください"}
    validates :recipe_title, presence: {message:"を入力してください"}
    validates :recipe_description, presence: {message:"を入力してください"}, length:{maximum:100}
    validates :number_persons, presence: {message:"を入力してください"}

    def user
        return User.find_by(id: self.user_id)
    end
end