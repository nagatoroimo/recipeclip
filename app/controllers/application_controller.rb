class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_user
  before_action :alarm
  
  def set_current_user
    @current_user = User.find_by(id: session[:user_id]) #現在のユーザーのユーザーIDを取得する
  end

  def administrator
    if session[:user_id] != 7
      redirect_to("/")
    end
  end

  def alarm #ログインした時にのみアラームアクションを実行
    if @current_user

      #クリップ数カウント
      @like_count = Like.where(notified_user_id: @current_user.id, read: false).count

      #一時保存レシピ数カウント
      @temp_count = Temp.where(notified_user_id: @current_user.id, read: false).count

      #フォロー数カウント
      @follow_count = Follow.where(notified_user_id: @current_user.id, read: false).count

      if @like_count >= 1
        @like_read = Like.where(notified_user_id: @current_user.id, read: false)
        @like_message = "投稿レシピがクリップされました。"
      end

      if @temp_count >= 1
        @temp_read = Temp.where(notified_user_id: @current_user.id, read: false)
        @temp_message = "一時保存レシピがあります。完成させましょう。"
      end

      if @follow_count >= 1
        @follow_read = Follow.where(notified_user_id: @current_user.id, read: false)#知らせなければいけない人がログインユーザーで、かつ未読のデータを取得
        @follow_message = "フォローされました。"
      end

      #カウントを足し算
      @count = @like_count + @temp_count + @follow_count

    end
  end
end

