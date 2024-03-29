# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_01_01_212837) do
  create_table "board_members", force: :cascade do |t|
    t.integer "year"
    t.string "avatar"
    t.boolean "supplementary"
    t.integer "member_id"
    t.string "name"
  end

  create_table "document_group_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "name_eng"
  end

  create_table "document_groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "display_name"
    t.integer "document_group_category_id"
    t.string "display_name_eng"
  end

  create_table "documents", force: :cascade do |t|
    t.string "name"
    t.string "attachment"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "document_group_id"
    t.string "name_eng"
  end

  create_table "event_parameter_choices", force: :cascade do |t|
    t.integer "event_parameter_id"
    t.string "value"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "name_eng"
  end

  create_table "event_parameter_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "event_parameters", force: :cascade do |t|
    t.integer "event_id"
    t.string "name"
    t.integer "event_parameter_type_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "required"
    t.string "name_eng"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.datetime "starttime", precision: nil
    t.datetime "endtime", precision: nil
    t.string "location"
    t.string "event_type"
    t.boolean "signup_required"
    t.datetime "signup_start", precision: nil
    t.datetime "signup_end", precision: nil
    t.datetime "signup_cancellable_until", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.text "descr"
    t.string "price"
    t.integer "signup_limit"
    t.integer "participants"
    t.boolean "members_only"
    t.text "descr_eng"
    t.string "name_eng"
    t.integer "contact_person_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "address"
    t.string "email"
    t.string "city"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "hyy_member"
    t.boolean "mathstudent"
    t.integer "joined"
    t.integer "user_id"
    t.string "nickname"
    t.string "tg_nick"
    t.integer "membership_valid_until"
  end

  create_table "memberships", force: :cascade do |t|
    t.integer "year"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "member_id"
  end

  create_table "news", force: :cascade do |t|
    t.text "text"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.text "header"
    t.integer "priority", default: 1
  end

  create_table "partners", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "link"
  end

  create_table "position_members", force: :cascade do |t|
    t.integer "year"
    t.integer "position_id"
    t.integer "member_id"
    t.string "name"
  end

  create_table "position_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "positions", force: :cascade do |t|
    t.string "name"
    t.boolean "show_in_contact_info"
    t.integer "priority"
    t.boolean "admin"
    t.integer "position_type"
    t.string "name_eng"
  end

  create_table "post_comments", force: :cascade do |t|
    t.integer "post_id"
    t.integer "user_id"
    t.text "comment"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "post_tags", force: :cascade do |t|
    t.integer "post_id"
    t.string "tag"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.text "text"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.string "image"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "priority"
    t.string "name_eng"
  end

  create_table "settings", force: :cascade do |t|
    t.string "setting"
    t.text "value"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "descr"
  end

  create_table "signup_parameters", force: :cascade do |t|
    t.integer "signup_id"
    t.integer "event_parameter_id"
    t.string "value"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "signups", force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "name"
    t.string "email"
    t.string "phonenumber"
    t.boolean "show"
  end

  create_table "texts", force: :cascade do |t|
    t.string "name"
    t.text "value"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.text "value_eng"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "admin"
    t.string "avatar"
  end

  add_foreign_key "events", "members", column: "contact_person_id"
end
