class Temp < ApplicationRecord
    has_many :materials
    has_many :recipe_steps

    has_one :relationship_category
    has_one :subject_category, through: :relationship_category, source: :category

    has_one :relationship_cookin_time
    has_one :subject_cooking_time, through: :relationship_cookin_time, source: :cooktime

    has_many :temporarily_materials, dependent: :destroy, class_name: "TemporarilyMaterial"
    has_many :temp_recipe_steps, dependent: :destroy, class_name: "TempRecipeStep"

    validates :user_id, presence: true
    #validates :recipe_image_name, presence: {message:"を選択してください"}
    #validates :recipe_title, presence: true
    #validates :recipe_description, presence: true, length:{maximum:100}
    #validates :cooking_time, presence: true
    #validates :number_persons, presence: true
    #validates :category, presence: true

end
