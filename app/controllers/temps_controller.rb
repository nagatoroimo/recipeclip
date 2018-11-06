class TempsController < ApplicationController
  layout "temp"

  before_action :ensure_correct_user, {only: [:index, :edit, :update, :destroy, :read]}

  def index
    @user = User.find_by(id: params[:user_id])
    @follows = Follow.where(user_id: @user.id)
    @likes_count = Like.where(user_id: @user.id).count
    @follows_count = Follow.where(user_id: @user.id).count
    @followers_count = Follow.where(follow_user_id: @user.id).count
    @temp = Temp.where(user_id: params[:user_id])
  end

  def new
  end

  def edit
    @user = User.find_by(id: params[:user_id])
    @temp = Temp.find_by(id: params[:id])
    @post = Post.new
    @time = RelationshipCookinTime.new

    @temp.temporarily_materials.where(temp_name: "", temp_quantity: "").destroy_all #マテリアルの中身がないデータを削除する
    @material = TemporarilyMaterial.new
    
    @temp.temp_recipe_steps.where(step: "").destroy_all #中身がないデータを削除する

    @step = TempRecipeStep.new
    @category = RelationshipCategory.new
  end

  def update
    if params[:temp]
      @temp = Temp.find_by(id: params[:id])
      @temp.recipe_title = params[:recipe_title]
      @temp.recipe_description = params[:recipe_description]
      @temp.number_persons = params[:number_persons]
      @temp.read = false   

      if params[:image] && @temp.recipe_image_name.blank?
        @temp.recipe_image_name = Time.now.strftime("%Y%m%d%H%M%S%N") + ".jpg"
        image = params[:image]
        File.binwrite("public/recipe_images/#{@temp.recipe_image_name}", image.read)
      end

      check_choice_temp_category  #params[:category]がある場合
      check_choice_temp_cooktime  #params[:cook_time]がある場合

      if @temp.save
        @temp.temporarily_materials.where(temp_name: "", temp_quantity: "").destroy_all
        params[:temporarily_material].each do |material|
          @material = TemporarilyMaterial.new(
            temp_id: @temp.id,
            temp_name: material["name"],
            temp_quantity: material["quantity"]    
          )
          @material.save
        end
        @temp.temp_recipe_steps.where(step: "").destroy_all
        params[:temp_recipe_step].each do |step|
          @step = TempRecipeStep.new(
            temp_id: @temp.id,
            step: step
          )
          @step.save
        end
      end

      flash[:notice] = "一時保存レシピを編集しました。"
      redirect_to("/users/#{@current_user.id}/temps")
    elsif params[:public]
      image_data = params[:image].read if params[:image]

      @user = User.find_by(id: params[:user_id])
      @temp = Temp.find_by(id: params[:id])
      @post = Post.new(
        #recipe_image_name: @temp.recipe_image_name,
        recipe_title: params[:recipe_title],
        recipe_description: params[:recipe_description],
        number_persons: params[:number_persons],
        user_id: @current_user.id
      )

      #一時保存レシピに画像がある場合は Post.recipe_image_name に代入する
      if @temp.recipe_image_name.present?
        @post.recipe_image_name = @temp.recipe_image_name
      end

      #params[:image] に画像データがある場合は置き換える
      #公開保存に失敗した場合は @temp.recipe_image_name の画像データを上書きする
      if params[:image]
        @post.recipe_image_name = Time.now.strftime("%Y%m%d%H%M%S%N") + ".jpg"
        File.binwrite("public/recipe_images/#{@post.recipe_image_name}", image_data)
      end

      Post.transaction do
        @post.save!

        if @temp.cooking_time.present?
          @time = RelationshipCookinTime.new(
            post_id: @post.id,
            cooktime_id: check_choice_cooktime
          )
          @time.save!
        elsif params[:cook_time]
          @time = RelationshipCookinTime.new(
            post_id: @post.id,
            cooktime_id: params[:cook_time]
          )
          @time.save!
        end

        if @temp.category.present?
          @category = RelationshipCategory.new(
            post_id: @post.id,
            category_id: check_choice_category
          )
          @category.save!
        elsif params[:category]
          @category = RelationshipCategory.new(
            post_id: @post.id,
            category_id: params[:category]
          )
          @category.save!
        end

        #もし一時保存レシピにマテリアルデータが存在する場合
        #一時保存のマテリアルデータの値をポストにそのまま登録する
        if @temp.temporarily_materials.present?
          @temp.temporarily_materials.each do |material|
            @material = Material.new(
              post_id: @post.id,
              name: material.temp_name,
              quantity: material.temp_quantity
            )
            @material.save!
          end
        #もし一時保存レシピにマテリアルデータが存在しない場合
        #かつ params[:temporarily_material] が存在する場合
        elsif params[:temporarily_material]
          params[:temporarily_material].each do |material|
            @material = Material.new(
              post_id: @post.id,
              name: material["name"],
              quantity: material["quantity"]
            )
            @material.save!
          end
        end

        #もし一時保存レシピにステップデータが存在する場合
        if @temp.temp_recipe_steps.present?
          @temp.temp_recipe_steps.each do |step|
            @step = RecipeStep.new(
              post_id: @post.id,
              step: step.step
            )
            @step.save!
          end
        #もし一時保存レシピにステップデータが存在しない場合
        #かつ params[:temp_recipe_step] が存在する場合
        elsif params[:temp_recipe_step]
          params[:temp_recipe_step].each do |step|
            @step = RecipeStep.new(
              post_id: @post.id,
              step: step
            )
            @step.save!
          end
        end
        
        flash[:notice] = "レシピを公開しました。"
        @temp.destroy
        redirect_to("/posts")
      end
    end
  rescue
 
    @temp = Temp.find_by(id: params[:id])

    #もしparams[:image]がある場合は画像を一時保存する
    if params[:image]
      @temp.recipe_image_name = Time.now.strftime("%Y%m%d%H%M%S%N") + ".jpg"
      File.binwrite("public/recipe_images/#{@temp.recipe_image_name}", image_data)
    end 

    #params[:category]の中身がある場合、そのデータを@temp.categoryに代入する。
    if @temp.category
      @temp_category = @temp.category
    end

    #もし params[:category] にデータがある場合は、check_choice_temp_cooktimeでカテゴリー名に置き換える
    if params[:category]
      @temp_category = check_choice_temp_category
    end
    
    #クッキングIDが選択されている場合、そのデータを@temp_cooking_timeに代入する。
    if @temp.cooking_time
      @temp_cooking_time = @temp.cooking_time
    end

    #もし params[:cook_time] にデータがある場合は、check_choice_temp_cooktimeでカテゴリー名に置き換える
    if params[:cook_time]
      @temp_cooking_time = check_choice_temp_cooktime
    end

    #一時保存データの更新
    @temp.update(
      recipe_title: params[:recipe_title],
      recipe_description: params[:recipe_description],
      category: @temp_category,
      cooking_time: @temp_cooking_time,
      number_persons: params[:number_persons],
      read: false
    )

    #材料・分量と作り方はwhereでデータを取得する
    #データの有る場合は現在の時間（created_at）より前に登録されたデータを全削除する
    #params[:temporarily_material]、params[:temp_recipe_step]の新しいデータを保存する
    #「""」は保存できないようにする

    @temp_material = TemporarilyMaterial.where(temp_id: params[:id])
    @temp_material.where("created_at <= ?", Time.now).destroy_all
    if params[:temporarily_material]
      params[:temporarily_material].each do |material|
        @temp_material = TemporarilyMaterial.new(
          temp_id: @temp.id,
          temp_name: material["name"],
          temp_quantity: material["quantity"]
        )
        #もし temporarily_material の材料・分量に "" が含まれる場合はsave後に削除する
        @temp_material.save
        @temp.temporarily_materials.where(temp_name: "", temp_quantity: "").destroy_all
      end
    end

    @temp_recipe_step = TempRecipeStep.where(temp_id: params[:id])
    @temp_recipe_step.where("created_at <= ?", Time.now).destroy_all
    if params[:temp_recipe_step]
      params[:temp_recipe_step].each do |step|
        @temp_recipe_step = TempRecipeStep.new(
          temp_id: @temp.id,
          step: step
        )
        @temp_recipe_step.save
        #もし temp_recipe_steps のステップに "" が含まれる場合はsave後に削除する
        @temp.temp_recipe_steps.where(step: "").destroy_all
      end
    end

    #エラーメッセージはPostモデルのバリデーションを発動させる。
    #一時保存なのでTempモデルのバリデーションは発動する必要はない。よって belongs_to に optional: true を記述する。
    #ユーザーを特定する @temp.user_id のみ presence:true する。
    #トリガーさせるため、あえてPostモデルへの保存を失敗させる。
    post_validation_trigger
    render("temps/edit")
  end

  def destroy
    @temp = Temp.find_by(id: params[:id])
    @user = User.find_by(id: @temp.user_id)

    @temp.destroy
    flash[:notice] = "一時保存レシピを削除しました。"
    redirect_to("/users/#{@user.id}/temps")
  end

  def read
    @user = User.find_by(id: params[:user_id])
    @temp = Temp.find_by(id: params[:id])
    @temp.read = true
    @temp.save
    redirect_to("/")
  end 

  def ensure_correct_user
    if @current_user.id != params[:user_id].to_i
      flash[:notice] = "権限がありません。"
      redirect_to("/users/#{@current_user.id}")
    end
  end

  private
  def check_choice_category
    if @temp.category == "ごはんもの"
      return 1
    elsif @temp.category == "汁もの"
      return 2
    elsif @temp.category == "麺もの"
      return 3
    elsif @temp.category == "鍋もの"
      return 4
    elsif @temp.category == "おかず"
      return 5
    elsif @temp.category == "おやつ"
      return 6
    end
  end

  def check_choice_cooktime
    if @temp.cooking_time == "10分以下"
      return 1
    elsif @temp.cooking_time == "20分以下"
      return 2
    elsif @temp.cooking_time == "30分以下"
      return 3
    elsif @temp.cooking_time == "60分以下"
      return 4
    elsif @temp.cooking_time == "60分以上"
      return 5
    end
  end

  def check_choice_temp_category
    if params[:category] == "1"
      return "ごはんもの"
    elsif params[:category] == "2"
      return "汁もの"
    elsif params[:category] == "3"
      return "麺もの"
    elsif params[:category] == "4"
      return "鍋もの"
    elsif params[:category] == "5"
      return "おかず"
    elsif params[:category] == "6"
      return "おやつ"
    end
  end

  def check_choice_temp_cooktime
    if params[:cook_time] == "1"
      return "10分以下"
    elsif params[:cook_time] == "2"
      return "20分以下"
    elsif params[:cook_time] == "3"
      return "30分以下"
    elsif params[:cook_time] == "4"
      return "60分以下"
    elsif params[:cook_time] == "5"
      return "60分以上"
    end
  end

  def post_validation_trigger
    @post = Post.new(
      recipe_image_name: @temp.recipe_image_name,
      recipe_title: params[:recipe_title],
      recipe_description: params[:recipe_description],
      number_persons: params[:number_persons],
    )
    
    @post.save

    @time = RelationshipCookinTime.new(
      post_id: @post.id,
      cooktime_id: params[:cook_time]
    )
    @cooktime_id = params[:cook_time]
    @time.save

    @category = RelationshipCategory.new(
      post_id: @post.id,
      category_id: params[:category]
    )
    @category_id = params[:category]
    @category.save

    params[:temporarily_material].each do |material|
      @material = Material.new(
        name: material["name"],
        quantity: material["quantity"]
      )
      @material.save
    end

    params[:temp_recipe_step].each do |step|
      @step = RecipeStep.new(
        post_id: @post.id,
        step: step
      )
      @step.save
    end
  end
end
