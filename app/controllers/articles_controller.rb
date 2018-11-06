class ArticlesController < ApplicationController
    def out
        @ip = request.remote_ip
        @article_id = params[:article_id].to_i
        @blog_id = params[:blog_id].to_i

        @week_out_point = WeekOutPoint.new(
            ip: @ip,
            article_id: @article_id,
            blog_id: @blog_id
        )
        @week_out_point.save
    
        @article = Article.find_by(id: params[:article_id])     #クリックされた記事データを取得
        @blog = @article.blog

        redirect_to(@article.url)
    end
end
