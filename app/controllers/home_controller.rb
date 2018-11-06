class HomeController < ApplicationController
  layout "home"

  #http://www.tom08.net/entry/2017/01/04/160933
  #http://opiyotan.hatenablog.com/entry/rss-ruby
  #https://srcw.net/wiki/?Feedjira/%E8%A7%A3%E6%9E%90
  #https://qiita.com/hirotakasasaki/items/3b31966294a809b99c4c


  def top
    @posts = Post.all
    @blog = Blog.all
    @like = Like.all

    @recipe_ranking = @like.ranking # for {1=>2, 2=>2, 3=>2, 4=>1, 5=>1}:Hash
		@week_vote_ranking = WeekInPoint.group(:blog_id).order("count(blog_id) desc")

    @article = Article.all.order(created_at: :desc).limit(4)
    @post_pr = Post.order("RANDOM()").limit(8)
    @categories = Category.all
    @notice = Notice.all.order(5)
  end

  def about
  end

end
