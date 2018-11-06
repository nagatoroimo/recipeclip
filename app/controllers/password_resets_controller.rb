class PasswordResetsController < ApplicationController
  before_action :get_user, only: [:edit, :update] #ユーザーを取得
  before_action :valid_user, only: [:edit, :update] #ユーザーが存在するか、有効化されているか、リセットトークンによる認証が成功するか
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def create
    @user = User.find_by(email: params[:email].downcase)
    if @user  #該当のメールアドレスがデータベースにある場合は
      @user.create_reset_digest #再設定用トークンとそれに対応するリセットダイジェストを生成する
      @user.send_password_reset_email
      @error_message = "パスワード再設定に必要なご案内を送信しました。"
      render("password_resets/new")
    else 
      @error_message = "該当するメールアドレスが見つかりませんでした。"
      render("password_resets/new")
    end
  end

  def edit
    @user = User.find_by(email: params[:email])
  end

  def get_user
    @user = User.find_by(email: params[:email])
  end

  # 正しいユーザーかどうか確認する
  def valid_user
    #「authenticate?」は引数の文字列がパスワードと一致するとUserオブジェクトを、間違っているとfalse返す
    #モデル内にpassword_digestという属性が含まれていることです。
    #引数に与えられた文字列 (パスワード) をハッシュ化した値と、データベース内にあるpassword_digestカラムの値を比較する
    unless (@user && @user.activated? && @user.authenticate(reset_digest: params[:id]))
    end
  end

  def check_expiration
    # 再設定用トークンが期限切れかどうかを確認する
    if @user.password_reset_expired
      flash[:danger] = "URLの有効期限が切れています。"
      redirect_to("/password_resets/new")
    end
  end


  def update
    if params[:password].empty?
      @message = "パスワードを入力してください。"
      render("password_resets/edit")
    elsif @user.update_attributes(password: params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "パスワードを更新しました。"
      redirect_to("/")
    end
  end
end
