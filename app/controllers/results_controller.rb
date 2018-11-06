class ResultsController < ApplicationController
  def index
    #@posts = Post.joins(:relationship_category, :relationship_cookin_time)
    #.where("relationship_categories.category.id = ? AND relationship_cookin_times.cooktime_id = ? ", params[:category], params[:cooking_time])

    @posts = Post.all

    if params[:category].present?
      @posts = @posts.joins(:relationship_category)
      .where("relationship_categories.category_id = ?", params[:category])
    end

    if params[:cooking_time].present?
      @posts = @posts.joins(:relationship_cookin_time)
      .where("relationship_cookin_times.cooktime_id = ?", params[:cooking_time])
    end

    if params[:search].present?
      @posts = @posts.where("recipe_title LIKE ? OR recipe_description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    end

    #多い順にデータを取得する
    @keyword_search_count = Keyword.group(:name).order("count(*) desc").limit(15).count
    @keyword_search_count.delete("")
    @keyword_search_count.delete(nil) 

    @posts_results = Post.where("recipe_category recipe_title LIKE ?", "%#{@keyword}%")
  end

  def keyword
    @keyword = params[:search]

    #データベースに、検索キーワードと検索数１を登録する
    @keyword_volume_counts = Keyword.new(name: params[:search], count: 1)
    @keyword_volume_counts.save

    #多い順にデータを取得する
    @keyword_search_count = Keyword.group(:name).order("count(*) desc").limit(15).count
    @keyword_search_count.delete("")
    @keyword_search_count.delete(nil) 

    @posts_results = Post.where(recipe_title: @keyword)
  end
end
