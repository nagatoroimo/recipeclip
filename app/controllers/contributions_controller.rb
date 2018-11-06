class ContributionsController < ApplicationController
    before_action :authenticate_user
  
    def create
        @contribution = Contribution.new(
            user_id: @current_user.id,
            post_id: params[:id],
            content: params[:content]
        )
        if @contribution.save
            flash[:notice] = "コメントを投稿しました。"
            redirect_to("/posts/#{params[:id]}")
        end
    end

    def destroy
        @contribution = Contribution.find_by(id: params[:id])
        @contribution.destroy
        flash[:notice] = "コメントを削除しました。"
        redirect_back(fallback_location: "/")
    end

    def reply
    end

    def authenticate_user
        if @current_user == nil
          flash[:notice] = "ログインが必要です。"
          redirect_to("/login")
        end
    end
end
