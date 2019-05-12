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

ActiveRecord::Schema.define(version: 2019_05_04_180852) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title", null: false, comment: "記事のタイトル"
    t.text "body", comment: "記事の本文"
    t.bigint "book_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_articles_on_book_id"
    t.index ["user_id", "book_id"], name: "index_articles_on_user_id_and_book_id"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title", null: false, comment: "本のタイトル"
    t.datetime "publish_on", comment: "出版日"
    t.integer "sheets", comment: "ページ数"
    t.integer "price", comment: "値段"
    t.string "image", comment: "本のサムネイル"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.bigint "recommend_id"
    t.bigint "book_id"
    t.string "description", comment: "登録した本の詳細文"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_groups_on_book_id"
    t.index ["recommend_id"], name: "index_groups_on_recommend_id"
  end

  create_table "recommends", force: :cascade do |t|
    t.string "name", null: false, comment: "グループ名"
    t.text "summary", null: false, comment: "概要"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_recommends_on_user_id"
  end

  create_table "regist_books", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_regist_books_on_book_id"
    t.index ["user_id", "book_id"], name: "index_regist_books_on_user_id_and_book_id", unique: true
    t.index ["user_id"], name: "index_regist_books_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", comment: "名前"
    t.string "provider", comment: "連携サービス"
    t.string "uid", comment: "ユニークID"
    t.string "username", comment: "サービス登録名"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "articles", "books"
  add_foreign_key "articles", "users"
  add_foreign_key "groups", "books"
  add_foreign_key "groups", "recommends"
  add_foreign_key "recommends", "users"
  add_foreign_key "regist_books", "books"
  add_foreign_key "regist_books", "users"
end
