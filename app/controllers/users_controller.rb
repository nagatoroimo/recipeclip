class UsersController < ApplicationController
  layout "user"

  before_action :authenticate_user, {only: [:index, :edit, :update, :destroy]} #ログインしているユーザーの場合のみの許可処理
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]} #ログインしているユーザーの禁止処理
  before_action :ensure_correct_user, {only: [:edit, :update, :temp]}
  before_action :registered_user, {only: [:new, :create]}#ブログ登録済みユーザーの禁止処理

  def index
    @users = User.all
  end
  
  def show
    @user = User.find_by(id: params[:id])
    @blog = Blog.find_by(user_id: params[:id])
    @likes = Like.where(user_id: params[:id])
    @likes_count = Like.where(user_id: @user.id).count
    @follows_count = Follow.where(user_id: @user.id).count
    @followers_count = Follow.where(follow_user_id: @user.id).count
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      image_name: "default_user.jpg",
      visual_image_name: "default_visual.jpg",
      profile: "レシピクリップをはじめました！よろしくお願いします。",
      activated: false
    )

    if @user.save
      UserMailer.account_activation(@user).deliver_now
      flash[:notice] = "メールを送信しました。RecipeClipを開始するにはメール内の「アカウントを有効化する」をクリックしてください。"
      redirect_to("/")
    else
      render("users/new")
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    @user.profile = params[:profile]

    if params[:sex] == 1
      @user.sex = "男"
    else
      @user.sex = "女"
    end

    if params[:image_name]
      @user.image_name = Time.now.strftime("%Y%m%d%H%M%S%N") + ".jpg"
      image = params[:image_name]
      File.binwrite("public/user_images/#{@user.image_name}",image.read)
    end

    if params[:visual_image_name]
      @user.visual_image_name = Time.now.strftime("%Y%m%d%H%M%S%N") + ".jpg"
      image = params[:visual_image_name]
      File.binwrite("public/page_images/#{@user.visual_image_name}",image.read)
    end

    if @user.save
      flash[:notice] = "登録情報を編集しました。"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    flash[:notice] = "ユーザー情報を削除しました。"
    @user.destroy
    redirect_to("/users")
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      if @user.activated?
        session[:user_id] = @user.id
        flash[:notice] = "ログインしました。"
        redirect_to("/users/#{@user.id}")
      else
        flash[:notice] = "アカウントが有効になっていません。送信メールに記載されているアカントの有効化をクリックし、アカウントを有効にしてください。"
        redirect_to("/")
      end
    else
      @error_message = "メールまたはパスワードに誤りがあります。"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました。"
    redirect_to("/login")
  end

  def likes
    @user = User.find_by(id: params[:id])
    @likes = Like.where(user_id: @user.id)
    @likes_count = Like.where(user_id: @user.id).count
    @follows_count = Follow.where(user_id: @user.id).count
    @followers_count = Follow.where(follow_user_id: @user.id).count
  end

  def follows
    @user = User.find_by(id: params[:id])
    @follows = Follow.where(user_id: @user.id)
    @likes_count = Like.where(user_id: @user.id).count
    @follows_count = Follow.where(user_id: @user.id).count
    @followers_count = Follow.where(follow_user_id: @user.id).count
  end

  def followers
    @user = User.find_by(id: params[:id])
    @followers = Follow.where(follow_user_id: @user.id)
    @likes_count = Like.where(user_id: @user.id).count
    @follows_count = Follow.where(user_id: @user.id).count
    @followers_count = Follow.where(follow_user_id: @user.id).count
  end

  def temp
    @user = User.find_by(id: params[:id])
    @follows = Follow.where(user_id: @user.id)
    @likes_count = Like.where(user_id: @user.id).count
    @follows_count = Follow.where(user_id: @user.id).count
    @followers_count = Follow.where(follow_user_id: @user.id).count
    @temp = Temp.where(user_id: params[:id])
  end

  def blog
    @user = User.find_by(id: params[:id])
    
  end

  def forbid_login_user
    if @current_user
      flash[:notice] = "すでにログインしています。"
      redirect_to("/users/#{@current_user.id}")
    end
  end

  def authenticate_user
    if @current_user == nil
      flash[:notice] = "ログインが必要です。"
      redirect_to("/login")
    end
  end
  
  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません。"
      redirect_to("//users/#{@current_user.id}")
    end
  end

  def registered_user
    @blog = Blog.find_by(id: @current_user)
    unless @blog.blank?
        flash[:notice] = "既に登録しています"
        redirect_to("/users/#{@current_user.id}")
    end            
  end
end
