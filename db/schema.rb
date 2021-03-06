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

ActiveRecord::Schema.define(version: 2019_06_03_160515) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "athletes", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.float "height"
    t.float "weight"
    t.integer "age"
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_athletes_on_email", unique: true
    t.index ["reset_password_token"], name: "index_athletes_on_reset_password_token", unique: true
  end

  create_table "athletes_coupons", force: :cascade do |t|
    t.bigint "athlete_id"
    t.bigint "coupon_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["athlete_id"], name: "index_athletes_coupons_on_athlete_id"
    t.index ["coupon_id"], name: "index_athletes_coupons_on_coupon_id"
  end

  create_table "athletes_courses", force: :cascade do |t|
    t.bigint "athlete_id"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["athlete_id"], name: "index_athletes_courses_on_athlete_id"
    t.index ["course_id"], name: "index_athletes_courses_on_course_id"
  end

  create_table "athletes_gyms", force: :cascade do |t|
    t.bigint "athlete_id"
    t.bigint "gym_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["athlete_id"], name: "index_athletes_gyms_on_athlete_id"
    t.index ["gym_id"], name: "index_athletes_gyms_on_gym_id"
  end

  create_table "coupons", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "gym_id"
    t.text "description"
    t.string "name"
  end

  create_table "course_comments", force: :cascade do |t|
    t.text "text"
    t.bigint "athlete_id"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["athlete_id"], name: "index_course_comments_on_athlete_id"
    t.index ["course_id"], name: "index_course_comments_on_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "gym_id"
    t.text "description"
    t.float "price"
  end

  create_table "gym_reviews", force: :cascade do |t|
    t.text "text"
    t.bigint "athlete_id"
    t.bigint "gym_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "stars"
    t.index ["athlete_id"], name: "index_gym_reviews_on_athlete_id"
    t.index ["gym_id"], name: "index_gym_reviews_on_gym_id"
  end

  create_table "gyms", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "address"
    t.decimal "latitude"
    t.decimal "longitude"
    t.index ["email"], name: "index_gyms_on_email", unique: true
    t.index ["reset_password_token"], name: "index_gyms_on_reset_password_token", unique: true
  end

  create_table "worksheets", force: :cascade do |t|
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "athlete_id"
    t.integer "gym_id"
    t.text "exercises", default: [], array: true
    t.boolean "completed"
    t.date "start"
    t.date "end"
  end

  add_foreign_key "athletes_coupons", "athletes"
  add_foreign_key "athletes_coupons", "coupons"
  add_foreign_key "athletes_courses", "athletes"
  add_foreign_key "athletes_courses", "courses"
  add_foreign_key "athletes_gyms", "athletes"
  add_foreign_key "athletes_gyms", "gyms"
  add_foreign_key "course_comments", "athletes"
  add_foreign_key "course_comments", "courses"
  add_foreign_key "gym_reviews", "athletes"
  add_foreign_key "gym_reviews", "gyms"
end
