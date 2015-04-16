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

ActiveRecord::Schema.define(version: 20150416102932) do

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.date     "starttime"
    t.date     "endtime"
    t.string   "location"
    t.string   "type"
    t.boolean  "signup_required"
    t.date     "signup_start"
    t.date     "signup_end"
    t.date     "signup_cancellable_until"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
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

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "name"
    t.boolean  "admin"
    t.boolean  "activated"
  end

end
