class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  #検索キーワードによる絞込み #参考ページ：https://blog.codecamp.jp/rails_text_21
  #scope :get_by_keyword, -> (keyword) {where("recipe_title or material LIKE ?", "%#{keyword}%")}
  #カテゴリーによる絞込み
  #scope :get_by_category, -> (category) {where(category: category)}
  #調理時間による絞込み
  #scope :get_by_cooking_time, -> (cooking_time) {where(cooking_time: cooking_time)}
  #検索条件に合致するレシピを抽出

end