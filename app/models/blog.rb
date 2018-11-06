class Blog < ApplicationRecord
    belongs_to :user
    has_many :articles
    has_many :week_out_points, dependent: :destroy
    has_many :week_in_points, dependent: :destroy
    has_many :day_in_points, dependent: :destroy

    validates :user_id, presence: true, uniqueness: true
    validates :blog_title, presence: {message:"を入力してください"}
    validates :blog_url, presence: {message:"を入力してください"}, format: URI::regexp(%w(http https))
    validates :rss_url, presence: {message:"を入力してください"}, format: URI::regexp(%w(http https))
    validates :blog_description, presence: {message:"を入力してください"}
end
