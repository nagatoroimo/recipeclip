class AccountActivationsController < ApplicationController

  def edit
    @user = User.find_by(email:params[:email])
    if @user && !@user.activated? && @user.authenticated?(:activation, params[:id])
      @user.update_attribute(:activated,true)
      @user.update_attribute(:activated_at,Time.zone.now)
      session[:user_id] = @user.id
      flash[:notice] = "アカウントの承認手続きが完了しました。"
      redirect_to("/")
    else
      flash[:notice] = "アカウントの承認手続きに失敗しました。"
      render("users/new")
    end
  end
end
