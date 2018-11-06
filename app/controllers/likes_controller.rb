class LikesController < ApplicationController
  before_action :authenticate_user

  def create
    @post = Post.find_by(id: params[:post_id])#投稿レシピの情報を取り出す
    @like = Like.new(
      user_id: @current_user.id,
      post_id: params[:post_id],
      notified_user_id: @post.user_id,
      read: false
      )
    @like.save
    redirect_to("/posts/#{params[:post_id]}")
  end
    
  def destroy
    @like = Like.find_by(user_id: @current_user.id, post_id: params[:post_id])
    @like.destroy
    redirect_to("/posts/#{params[:post_id]}")
  end

  def read
    @like = Like.find_by(id: params[:id])
    @like.read = true
    @like.save
    redirect_to("/")
  end

  def authenticate_user
    if @current_user == nil
      flash[:notice] = "ログインが必要です。"
      redirect_to("/login")
    end
  end
end