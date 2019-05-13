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

ActiveRecord::Schema.define(version: 2019_05_12_113758) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "article_favs", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_article_favs_on_article_id"
    t.index ["user_id", "article_id"], name: "index_article_favs_on_user_id_and_article_id", unique: true
    t.index ["user_id"], name: "index_article_favs_on_user_id"
  end

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

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "article_id"
    t.text "content", comment: "コメント本文"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_comments_on_article_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
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

  create_table "recommend_favs", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "recommend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recommend_id"], name: "index_recommend_favs_on_recommend_id"
    t.index ["user_id", "recommend_id"], name: "index_recommend_favs_on_user_id_and_recommend_id", unique: true
    t.index ["user_id"], name: "index_recommend_favs_on_user_id"
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

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
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

  add_foreign_key "article_favs", "articles"
  add_foreign_key "article_favs", "users"
  add_foreign_key "articles", "books"
  add_foreign_key "articles", "users"
  add_foreign_key "comments", "articles"
  add_foreign_key "comments", "users"
  add_foreign_key "groups", "books"
  add_foreign_key "groups", "recommends"
  add_foreign_key "recommend_favs", "recommends"
  add_foreign_key "recommend_favs", "users"
  add_foreign_key "recommends", "users"
  add_foreign_key "regist_books", "books"
  add_foreign_key "regist_books", "users"
end
