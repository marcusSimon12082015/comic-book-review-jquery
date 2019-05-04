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

ActiveRecord::Schema.define(version: 2019_05_04_144741) do

  create_table "artist_comics", force: :cascade do |t|
    t.integer "comic_id"
    t.integer "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_artist_comics_on_artist_id"
    t.index ["comic_id"], name: "index_artist_comics_on_comic_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "biography"
    t.string "artist_image"
    t.integer "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type_id"], name: "index_artists_on_type_id"
  end

  create_table "character_comics", force: :cascade do |t|
    t.integer "character_id"
    t.integer "comic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_comics_on_character_id"
    t.index ["comic_id"], name: "index_character_comics_on_comic_id"
  end

  create_table "characters", force: :cascade do |t|
    t.integer "publisher_id"
    t.string "name"
    t.string "bio"
    t.string "character_image"
    t.index ["publisher_id"], name: "index_characters_on_publisher_id"
  end

  create_table "comics", force: :cascade do |t|
    t.string "title"
    t.date "release_date"
    t.string "description"
    t.integer "publisher_id"
    t.float "price"
    t.integer "pages"
    t.float "rating", default: 0.0
    t.string "comic_cover_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publisher_id"], name: "index_comics_on_publisher_id"
  end

  create_table "publishers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id"
    t.integer "comic_id"
    t.string "title"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comic_id"], name: "index_reviews_on_comic_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_comics", force: :cascade do |t|
    t.integer "user_id"
    t.integer "comic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comic_id"], name: "index_user_comics_on_comic_id"
    t.index ["user_id"], name: "index_user_comics_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "biography"
    t.float "credits", default: 100.0
    t.integer "role", default: 0
    t.string "uid"
    t.string "provider"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
