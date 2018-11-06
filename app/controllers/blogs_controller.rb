class BlogsController < ApplicationController
    require 'rake'

    before_action :authenticate_user, {only: [:show, :new, :create, :edit, :destroy]} #ログインしているユーザーの場合のみの許可処理
    before_action :ensure_correct_user, {only: [:show, :edit, :destroy]}

    def show
        @user = User.find_by(id: params[:user_id])
        @likes = Like.where(user_id: params[:id])
        @likes_count = Like.where(user_id: @user.id).count
        @follows_count = Follow.where(user_id: @user.id).count
        @followers_count = Follow.where(follow_user_id: @user.id).count
        @blog = Blog.find_by(user_id: params[:user_id])

        #https://qiita.com/ryonext/items/4ed2f7635135a7b388f3
        #https://webuilder240.hatenablog.com/entry/2016/01/28/211218　歯抜け対策
        #@date_time = WeekInPoint.where(blog_id: @blog.id, created_at: 1.week.ago.beginning_of_day..Time.zone.now.end_of_day)
        #Dayデータはサーバー負担が大きいので一旦休止
        #@week_in_data = WeekInPoint.where(blog_id: @blog.id).group("DATE(created_at)").select("DATE(created_at)").count
        #@week_out_data = WeekOutPoint.where(blog_id: @blog.id).group("DATE(created_at)").select("DATE(created_at)").count
    end

    def new
        @blog = Blog.new()
    end

    def create
        @blog = Blog.new(
            blog_title: params[:blog_title],
            blog_url: params[:blog_url],
            blog_description: params[:blog_description],
            user_id: @current_user.id,
            blog_id: @current_user.id
        )
        if @blog.save
            flash[:notice] = "ブログを登録しました"
            redirect_to("/users/#{@current_user.id}")
        else
            render("blogs/new")
        end
    end
    
    def edit
        @user = User.find_by(id: params[:user_id])
        @blog = Blog.find_by(id: params[:blog_id])
    end

    def update
        @user = User.find_by(id: params[:user_id])
        @blog = Blog.find_by(id: params[:blog_id])
        @blog.blog_title = params[:blog_title]
        @blog.blog_url = params[:blog_url]
        @blog.blog_description = params[:blog_description]
        @blog.rss_url = params[:rss_url]

        if @blog.save
            binding.pry
            redirect_to("/blog/#{@user.id}/#{@blog.id}")
        else
            render("blogs/edit")
        end
    end

    def rss
        @user = User.find_by(id: params[:id])
        @blog = Blog.find_by(user_id: @user.id)
        @blog_name = @blog.blog_title
        @blog_url = @blog.blog_url
        @rss_url = @blog.rss_url

        @likes = Like.where(user_id: params[:id])
        @likes_count = Like.where(user_id: @user.id).count
        @follows_count = Follow.where(user_id: @user.id).count
        @followers_count = Follow.where(follow_user_id: @user.id).count
    end

    def qa
    end
    
   
    def in
        @ip = request.remote_ip
        @blog_id = params[:blog_id].to_i


        #Dayデータはサーバー負担が大きいので一旦休止
        #@day_vote = DayInPoint.where(blog_id: @blog_id)
        #if @day_vote.present?
        #    @day_vote.each do |dayvote|
        #        unless dayvote.created_at < 1.day.ago && dayvote.id == @ip     #24時間以内かつIPが同じ場合でなければDB登録する
        #            @day_in_point = DayInPoint.new(
        #                ip: @ip,
        #                blog_id: @blog_id
        #            )
        #            @day_in_point.save
        #        end
        #    end
        #else                                                                        #データがない場合は新規登録
        #    @day_in_point = DayInPoint.new(
        #        ip: @ip,
        #        blog_id: @blog_id
        #    )
        #    @day_in_point.save
        #end

        @week_vote = WeekInPoint.where(blog_id: @blog_id)	#応援データベースにて該当のブログIDを検索　#24時間でリセットする
        if @week_vote.present?
            @vote_user = @week_vote.where(ip:@ip)           #クリックしたユーザーのIPアドレスの過去のクリック履歴を取得
            @last_vote = @vote_user.last                    #最後のクリックデータを取得

            if @last_vote.created_at > 1.day.ago            #もし最後のクリックデータの時間が現在時刻から換算して24時間以内だった場合
                redirect_to("/votes/ranking")
            else                                            #上記の条件が成立しない場合
                @week_in_point = WeekInPoint.new(
                    ip: @ip,
                    blog_id: @blog_id
                )
                @week_in_point.save
                redirect_to("/votes/ranking")
            end
        else
            @week_in_point = WeekInPoint.new(
                ip: @ip,
                blog_id: @blog_id
            )
            @week_in_point.save
            redirect_to("/votes/ranking")and return
        end
    end

    def destroy
    end

    def authenticate_user
        if @current_user == nil
          flash[:notice] = "ログインが必要です。"
          redirect_to("/login")
        end
    end

    def ensure_correct_user
        if @current_user.id != params[:user_id].to_i
          flash[:notice] = "権限がありません。"
          redirect_to("/users/#{@current_user.id}")
        end
    end
end
