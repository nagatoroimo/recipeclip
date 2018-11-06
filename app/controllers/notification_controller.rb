class NotificationController < ApplicationController
  def like_through
    like = Like.find_by(post_id: params[:id], user_id: params[:user_id])
    like.read = true
    like.save
    redirect_to("/posts/#{like.post_id}")
  end

  def temp_through
    temp = Temp.find_by(id: params[:id])
    temp.read = true
    temp.save
    redirect_to("/users/#{temp.user_id}/temps")
  end

  def follow_through
    follow = Follow.find_by(id: params[:id])
    follow.read = true
    follow.save
    redirect_to("/users/#{follow.user_id}")
  end
end