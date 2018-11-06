# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20181004142207) do

  create_table "articles", force: :cascade do |t|
    t.datetime "published"
    t.text "content"
    t.string "url"
    t.string "author"
    t.integer "feed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "blog_id"
    t.string "thumbnail"
  end

  create_table "blogs", force: :cascade do |t|
    t.string "user_id"
    t.string "blog_title"
    t.string "blog_url"
    t.string "blog_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "rss_url"
    t.integer "blog_id"
  end

  create_table "categorails", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "post_id"
  end

  create_table "contributions", force: :cascade do |t|
    t.string "user_id"
    t.string "post_id"
    t.text "contribution"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "content"
  end

  create_table "cook_times", force: :cascade do |t|
    t.string "time"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cooking_times", force: :cascade do |t|
    t.integer "post_id"
    t.string "time"
    t.string "string"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cooktimes", force: :cascade do |t|
    t.string "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "day_in_points", force: :cascade do |t|
    t.string "ip"
    t.integer "blog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_id"], name: "index_day_in_points_on_blog_id"
  end

  create_table "day_votes", force: :cascade do |t|
    t.string "ip"
    t.integer "blog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_id"], name: "index_day_votes_on_blog_id"
  end

  create_table "destroys", force: :cascade do |t|
    t.string "categorails"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feeds", force: :cascade do |t|
    t.string "image"
    t.string "name"
    t.string "url"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "follows", force: :cascade do |t|
    t.integer "user_id"
    t.integer "follow_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "read", default: false, null: false
    t.integer "notified_user_id"
  end

  create_table "keyword_counts", force: :cascade do |t|
    t.string "keyword"
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "keyword_volume_counts", force: :cascade do |t|
    t.string "search_keyword"
    t.integer "keyword_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "keywords", force: :cascade do |t|
    t.string "name"
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "read", default: false, null: false
    t.integer "notified_user_id"
  end

  create_table "materials", force: :cascade do |t|
    t.integer "post_id"
    t.string "name"
    t.string "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notices", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "time"
  end

  create_table "posts", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "recipe_title"
    t.text "recipe_description"
    t.string "recipe_image_name"
    t.text "quantity"
    t.string "category"
    t.string "cooking_time"
    t.string "number_persons"
    t.text "recipe_step"
    t.integer "category_id"
    t.text "material"
    t.integer "post_id"
  end

  create_table "recipe_steps", force: :cascade do |t|
    t.integer "post_id"
    t.string "step"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "references", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rekationship_cooking_times", force: :cascade do |t|
    t.integer "post_id"
    t.integer "time_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id", "time_id"], name: "index_rekationship_cooking_times_on_post_id_and_time_id"
    t.index ["post_id"], name: "index_rekationship_cooking_times_on_post_id"
    t.index ["time_id"], name: "index_rekationship_cooking_times_on_time_id"
  end

  create_table "relationship_categories", force: :cascade do |t|
    t.integer "post_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_relationship_categories_on_category_id"
    t.index ["post_id", "category_id"], name: "index_relationship_categories_on_post_id_and_category_id"
    t.index ["post_id"], name: "index_relationship_categories_on_post_id"
  end

  create_table "relationship_cook_times", force: :cascade do |t|
    t.integer "post_id"
    t.integer "time_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_relationship_cook_times_on_post_id"
    t.index ["time_id"], name: "index_relationship_cook_times_on_time_id"
  end

  create_table "relationship_cookin_times", force: :cascade do |t|
    t.integer "post_id"
    t.integer "cooktime_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cooktime_id"], name: "index_relationship_cookin_times_on_cooktime_id"
    t.index ["post_id", "cooktime_id"], name: "index_relationship_cookin_times_on_post_id_and_cooktime_id"
    t.index ["post_id"], name: "index_relationship_cookin_times_on_post_id"
  end

  create_table "relationship_cookingtimes", force: :cascade do |t|
    t.integer "post_id"
    t.integer "time_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id", "time_id"], name: "index_relationship_cookingtimes_on_post_id_and_time_id"
    t.index ["post_id"], name: "index_relationship_cookingtimes_on_post_id"
    t.index ["time_id"], name: "index_relationship_cookingtimes_on_time_id"
  end

  create_table "relationship_cooktimes", force: :cascade do |t|
    t.integer "post_id_id"
    t.integer "time_id_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id_id"], name: "index_relationship_cooktimes_on_post_id_id"
    t.index ["time_id_id"], name: "index_relationship_cooktimes_on_time_id_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "temp_materials", force: :cascade do |t|
    t.integer "temp_id"
    t.string "name"
    t.string "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "temp_recipe_steps", force: :cascade do |t|
    t.integer "temp_id"
    t.string "step"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "temporarily_materials", force: :cascade do |t|
    t.integer "temp_id"
    t.string "temp_name"
    t.string "temp_quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "temps", force: :cascade do |t|
    t.string "recipe_image_name"
    t.string "recipe_title"
    t.text "recipe_description"
    t.string "category"
    t.string "cooking_time"
    t.string "number_persons"
    t.text "material"
    t.text "recipe_step"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "read"
    t.integer "notified_user_id"
  end

  create_table "temps_materials", force: :cascade do |t|
    t.integer "temp_id"
    t.string "temp_material"
    t.string "temp_quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_image"
    t.string "image_name"
    t.string "password_digest"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.string "activation_digest"
    t.boolean "activated"
    t.datetime "activated_at"
    t.string "visual_image_name"
    t.string "remember_digest"
    t.string "profile"
    t.string "visual"
    t.string "tel"
    t.string "sex"
  end

  create_table "week_in_points", force: :cascade do |t|
    t.string "ip"
    t.integer "blog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_id"], name: "index_week_in_points_on_blog_id"
  end

  create_table "week_out_points", force: :cascade do |t|
    t.string "ip"
    t.integer "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "blog_id"
    t.index ["article_id"], name: "index_week_out_points_on_article_id"
    t.index ["blog_id"], name: "index_week_out_points_on_blog_id"
  end

  create_table "week_votes", force: :cascade do |t|
    t.string "ip"
    t.integer "blog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_id"], name: "index_week_votes_on_blog_id"
  end

end
