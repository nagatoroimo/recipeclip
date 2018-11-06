class PostsController < ApplicationController
  layout "posts"
 
  before_action :authenticate_user, {only: [:new, :create, :edit, :update, :destroy]}
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}


  def new
    @post = Post.new
    @category = RelationshipCategory.new
    @time = RelationshipCookinTime.new
    @material = Material.new
    @step = RecipeStep.new
  end

  def show
    @post = Post.find_by(id: params[:id])   #投稿レシピのIDを取得
    @user = User.find_by(id: @post.user_id) #レシピを投稿したユーザーIDを取得
    @likes_count = Like.where(post_id: @post.id).count

    @category = @post.relationship_category
    @subject_category = @post.subject_category
    @time = @post.relationship_cookin_time

    @subject_cooktime = @post.subject_cooking_time

    @number_persons = @post.number_persons
    @category = @post.category
    
    @post_material = @post.materials
    @material = @post_material.order("created_at desc").reverse_order

    @recipe_step = @post.recipe_step
    @post_recipe_step_group = @post.recipe_steps.group(:step)
    @post_recipe_step = @post_recipe_step_group.order("created_at desc").reverse_order

    @contribution = Contribution.where(post_id: params[:id]) #post_idのデータを抽出
    @contribution_count = Contribution.where(post_id: params[:id]).count #post_idの投稿データ数を抽出
    @post_pr = Post.order("RANDOM()").limit(4)
    @notice = Notice.order(created_at: :desc).limit(5)
  end

  def create
    if params[:temp]
      @temp = Temp.new(
        recipe_title: params[:recipe_title],
        recipe_description: params[:recipe_description],
        category: params[:category],
        cooking_time: params[:cook_time],
        number_persons: params[:number_persons],
        user_id: @current_user.id,
        notified_user_id: @current_user.id,
        read: false
      )

     
      if params[:image]
        @temp.recipe_image_name = Time.now.strftime("%Y%m%d%H%M%S%N") + ".jpg"
        image = params[:image]
        File.binwrite("public/recipe_images/#{@temp.recipe_image_name}",image.read)
      end
      
      if @temp.save

        redirect_to("/users/#{@current_user.id}/temps")
      end
    elsif[:public]
      image_data = params[:image].read if params[:image]
      @post = Post.new(
        #recipe_image_name: params[:image],
        recipe_title: params[:recipe_title],  #20180408に追加
        recipe_description: params[:recipe_description],  #20180408に追加
        number_persons: params[:number_persons],
        user_id: @current_user.id,
      )

      if params[:image_path]
        @post.recipe_image_name = params[:image_path]
      end

      if params[:image]
        @post.recipe_image_name = Time.now.strftime("%Y%m%d%H%M%S%N") + ".jpg"
        File.binwrite("public/recipe_images/#{@post.recipe_image_name}", image_data)
      end

      Post.transaction do 
        @post.save!
        @time = RelationshipCookinTime.new(
          post_id: @post.id,
          cooktime_id: params[:cook_time]
        )
        @time.save!
        @category = RelationshipCategory.new(
          post_id: @post.id,
          category_id: params[:category]
        )
        @category.save!
        params[:material].each do |material|
          @material = Material.new(
            post_id: @post.id,
            name: material["name"],
            quantity: material["quantity"]    
          )
          @material.save!
        end
        params[:recipe_step].each do |step|
          @step = RecipeStep.new(
            post_id: @post.id,
            step: step
          )
          @step.save!
        end
        flash[:notice] = "レシピを投稿しました。"
        redirect_to("/posts/#{@post.id}")
      end
    end
  rescue
    @recipe_image_name = @post.recipe_image_name        #レシピ画像
    @recipe_title = params[:recipe_title]               #レシピ名
    @recipe_description = params[:recipe_description]   #レシピの説明
    check_choice_cooktime                               #調理時間
    @number_persons = params[:number_persons]           #何人分
    check_choice_category                               #カテゴリー

    params[:material].each do |material|                #材料・分量
      @material_name = material["name"]
      @material_quantity = material["quantity"]
    end

    params[:recipe_step].each do |step|                 #作り方
      @recipe_step = step
    end

    @post = Post.new(
      recipe_image_name: @post.recipe_image_name,
      recipe_title: params[:recipe_title],
      recipe_description: params[:recipe_description],
      number_persons: params[:number_persons],
      user_id: @current_user.id,
    )
    @post.save                                          #validates　エラー表示用
    @time = RelationshipCookinTime.new(
      post_id: @post.id,
      cooktime_id: params[:cook_time]
    )
    @cooktime_id = params[:cook_time]
    @time.save                                          #validates　エラー表示用
    @category = RelationshipCategory.new(
      post_id: @post.id,
      category_id: params[:category]
    )
    @category_id = params[:category]
    @category.save                                      #validates　エラー表示用
    params[:material].each do |material|
      @material = Material.new(
        post_id: @post.id,
        name: material["name"],
        quantity: material["quantity"]    
      )
      @material.save                                    #validates　エラー表示用
    end
    params[:recipe_step].each do |step|
      @step = RecipeStep.new(
        post_id: @post.id,
        step: step
      )
      @step.save                                        #validates　エラー表示用
    end
  
    render("posts/new")
  end

  def edit
    @post = Post.find_by(id: params[:id])
    @time = @post.subject_cooking_time
    @cooking_id = @time.id
    @cooking_time = @time.time
    @category = @post.subject_category
    @category_id = @category.id
    @category_name = @category.name
    @material = @post.materials
    @step = @post.recipe_steps
  end

  def update
    image_data = params[:image].read if params[:image]

    @post = Post.find_by(id: params[:id])
    @time = RelationshipCookinTime.find_by(post_id: @post.id)
    @category = RelationshipCategory.find_by(post_id: @post.id)
    @material = Material.where(post_id: @post.id)
    @step = RecipeStep.where(post_id: @post.id)

    if params[:image]
      @recipe_image_name = Time.now.strftime("%Y%m%d%H%M%S%N") + ".jpg"
      File.binwrite("public/recipe_images/#{@recipe_image_name}",image_data)
    end

    Post.transaction do

      @post.save!(
        recipe_title: params[:recipe_title],
        recipe_description: params[:recipe_description],
        recipe_image_name: @recipe_image_name,
        number_persons: params[:number_persons],
      )

      @time.save!(cooktime_id: params[:cook_time])
      @category.save!(category_id: params[:category])

      @material = Material.where(post_id: @post.id)
      @material.where("created_at <= ?", Time.now).destroy_all
      params[:material].each do |material|
        @material = Material.new(
          post_id: @post.id,
          name: material["name"],
          quantity: material["quantity"]    
        )
        @material.save!
      end
      @post.materials.where(name: "", quantity: "").destroy_all

      @step = RecipeStep.where(post_id: @post.id)
      @step.where("created_at <= ?", Time.now).destroy_all
      params[:recipe_step].each do |step|
        @step = RecipeStep.new(
          post_id: @post.id,
          step: step
        )
        @step.save!
      end
      @post.recipe_steps.where(step: "").destroy_all

      
      flash[:notice] = "レシピを編集しました。"
      redirect_to("/posts/#{@post.id}")
    end
  rescue
    @post = Post.find_by(id: params[:id])

    #もしPostデータにrecipe_image_name がある場合は@recipe_image_nameに代入する
    if @post.recipe_image_name
      @recipe_image_name = @post.recipe_image_name
    end

    #もしparams[:image]のデータがある場合は新規登録
    if params[:image]
      @recipe_image_name = Time.now.strftime("%Y%m%d%H%M%S%N") + ".jpg"
      File.binwrite("public/recipe_images/#{@recipe_image_name}",image_data)
    end

    #編集ページなのでparamsデータは全て存在している
    #よって画像以外は全てparamsのデータを代入し更新させる
    @post.update(
      recipe_image_name: @recipe_image_name,
      recipe_title: params[:recipe_title],
      recipe_description: params[:recipe_description],
      number_persons: params[:number_persons]
    )

    #調理時間更新
    @time = RelationshipCookinTime.find_by(post_id: @post.id)
    if params[:cook_time]
      @time.update(cooktime_id: params[:cook_time])

      @cooking_id = @post.subject_cooking_time.id
      check_choice_cooktime
    end

    #カテゴリー更新
    @catgory = RelationshipCategory.find_by(post_id: @post.id)
    if params[:category]
      @category.update(category_id: params[:category])

      @category_id = @post.subject_category.id
      check_choice_category
    end
    #古いデータの削除
    #材料・分量登録
    #新規登録データに空値がある場合は削除
    @material = Material.where(post_id: @post.id)
    @material.where("created_at <= ?", Time.now).destroy_all
    params[:material].each do |material|
      @material = Material.new(
        post_id: @post.id,
        name: material["name"],
        quantity: material["quantity"]    
      )
      @material.save
    end
    @post.materials.where(name: "", quantity: "").destroy_all

    #古いデータの削除
    #作り方新規登録
    #新規登録データに空値がある場合は削除
    @step = RecipeStep.where(post_id: @post.id)
    @step.where("created_at <= ?", Time.now).destroy_all
    params[:recipe_step].each do |step|
      @step = RecipeStep.new(
        post_id: @post.id,
        step: step
      )
      @step.save
    end
    @post.recipe_steps.where(step: "").destroy_all

    render("posts/edit")
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
   
    flash[:notice] = "レシピを削除しました。"
    redirect_to("/posts")
  end

  def result
    @posts = Post.search(params[:search])
  end

  def type
    @posts = Post.find_by(category: params[:category])
    @posts_category_type = Post.where(category: params[:category])
  end


  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "権限がありません。"
      redirect_to("/posts/")
    end
  end

  def authenticate_user
    if @current_user == nil
      flash[:notice] = "ログインが必要です。"
      redirect_to("/login")
    end
  end

  private
  def check_choice_category
    if params[:category] == "1"
      @category_name = "ごはんもの"
    elsif params[:category] == "2"
      @category_name = "汁もの"
    elsif params[:category] == "3"
      @category_name = "麺もの"
    elsif params[:category] == "4"
      @category_name = "鍋もの"
    elsif params[:category] == "5"
      @category_name = "おかず"
    elsif params[:category] == "6"
      @category_name = "おやつ"
    end
  end

  def check_choice_cooktime
    if params[:cook_time] == "1"
      @cooking_time = "10分以下"
    elsif params[:cook_time] == "2"
      @cooking_time = "20分以下"
    elsif params[:cook_time] == "3"
      @cooking_time = "30分以下"
    elsif params[:cook_time] == "4"
      @cooking_time = "60分以下"
    elsif params[:cook_time] == "5"
      @cooking_time = "60分以上"
    end
  end
end
