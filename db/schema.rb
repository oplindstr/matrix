# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160322111902) do

  create_table "board_members", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "year"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "avatar"
  end

  create_table "documents", force: :cascade do |t|
    t.string   "name"
    t.string   "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.datetime "starttime"
    t.datetime "endtime"
    t.string   "location"
    t.string   "event_type"
    t.boolean  "signup_required"
    t.datetime "signup_start"
    t.datetime "signup_end"
    t.datetime "signup_cancellable_until"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.text     "descr"
    t.string   "price"
    t.integer  "signup_limit"
  end

  create_table "hands", force: :cascade do |t|
    t.integer  "match_id"
    t.integer  "points1"
    t.integer  "points2"
    t.integer  "declarer"
    t.integer  "bid"
    t.integer  "contract"
    t.boolean  "made"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "player1"
    t.integer  "player2"
    t.integer  "player3"
    t.integer  "player4"
    t.integer  "winners"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.float    "expectation"
    t.float    "deviation"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "abbreviation"
    t.integer  "user_id"
    t.boolean  "private"
  end

  create_table "position_members", force: :cascade do |t|
    t.integer "user_id"
    t.integer "year"
    t.integer "position_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "name"
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settings", force: :cascade do |t|
    t.string   "setting"
    t.text     "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "signups", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_groups", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "firstname"
    t.boolean  "admin"
    t.boolean  "activated"
    t.string   "email"
    t.string   "city"
    t.string   "phonenumber"
    t.datetime "joined"
    t.boolean  "hyy_member"
    t.boolean  "mathstudent"
    t.string   "lastname"
  end

end
