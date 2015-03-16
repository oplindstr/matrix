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

ActiveRecord::Schema.define(version: 20150316171013) do

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

  create_table "hp_statistics", force: :cascade do |t|
    t.integer  "u_id"
    t.float    "expectation"
    t.float    "deviation"
    t.float    "assurity"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "name"
  end

end
