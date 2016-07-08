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

ActiveRecord::Schema.define(version: 20160708121230) do

  create_table "comments", force: :cascade do |t|
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "movie_id"
    t.integer  "user_id"
    t.index ["movie_id"], name: "index_comments_on_movie_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.string   "poster"
    t.integer  "year"
    t.text     "plot_summary"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "comments_id"
    t.index ["comments_id"], name: "index_movies_on_comments_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer  "comments_id"
    t.string   "username"
    t.string   "password"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["comments_id"], name: "index_users_on_comments_id"
  end

end
