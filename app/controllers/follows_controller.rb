class FollowsController < ApplicationController
    before_action :authenticate_user

    def create
        @follow = Follow.new(
            user_id: @current_user.id,
            follow_user_id: params[:user_id],
            notified_user_id: params[:user_id],
            read: false
            )
        @follow.save
        redirect_back(fallback_location: "/")
    end

    def destroy
        @follow = Follow.find_by(user_id: @current_user.id, follow_user_id: params[:user_id])
        @follow.destroy
        redirect_back(fallback_location: "/")
    end
 
    def read
        @follow = Follow.find_by(id: params[:id])
        @follow.read = true
        @follow.save
        redirect_to("/")
    end

    def authenticate_user
      if @current_user == nil
        flash[:notice] = "ログインが必要です。"
        redirect_to("/login")
      end
    end
end