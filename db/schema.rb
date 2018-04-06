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

ActiveRecord::Schema.define(version: 20180406150021) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "slot_id"
    t.bigint "prof_id"
    t.index ["prof_id"], name: "index_bookings_on_prof_id"
    t.index ["slot_id"], name: "index_bookings_on_slot_id"
  end

  create_table "friend_jobs", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "rate", precision: 8, scale: 2
    t.bigint "friend_id"
    t.index ["friend_id"], name: "index_friend_jobs_on_friend_id"
  end

  create_table "friends", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "name"
    t.string "address"
    t.string "service"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_friends_on_email", unique: true
    t.index ["reset_password_token"], name: "index_friends_on_reset_password_token", unique: true
  end

  create_table "hospitals", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "institution_name"
    t.string "street"
    t.string "city"
    t.string "zip"
    t.string "phone"
    t.string "publishable_key"
    t.string "provider"
    t.string "uid"
    t.string "access_code"
    t.index ["email"], name: "index_hospitals_on_email", unique: true
    t.index ["reset_password_token"], name: "index_hospitals_on_reset_password_token", unique: true
  end

  create_table "jobs", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "rate", precision: 8, scale: 2
    t.datetime "expiration"
    t.bigint "hospital_id"
    t.string "slot_num"
    t.integer "rate_select"
    t.index ["hospital_id"], name: "index_jobs_on_hospital_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "recipient_id"
    t.integer "actor_id"
    t.datetime "read_at"
    t.string "action"
    t.integer "notifiable_id"
    t.string "notifiable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profs", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "license_num"
    t.string "job_title"
    t.string "image"
    t.string "bio"
    t.string "phone"
    t.string "publishable_key"
    t.string "provider"
    t.string "uid"
    t.string "access_code"
    t.string "linkedin_uid"
    t.string "link_provider"
    t.string "link_token"
    t.string "link_secret"
    t.index ["email"], name: "index_profs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_profs_on_reset_password_token", unique: true
  end

  create_table "slots", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "job_id"
    t.boolean "available", default: true
    t.index ["job_id"], name: "index_slots_on_job_id"
  end

  add_foreign_key "bookings", "profs"
  add_foreign_key "bookings", "slots"
  add_foreign_key "jobs", "hospitals"
  add_foreign_key "slots", "jobs"
end
