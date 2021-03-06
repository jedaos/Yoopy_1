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

ActiveRecord::Schema.define(version: 2018_06_25_160243) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "bookings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "slot_id"
    t.bigint "prof_id"
    t.boolean "paid", default: false
    t.string "booking_type"
    t.index ["prof_id"], name: "index_bookings_on_prof_id"
    t.index ["slot_id"], name: "index_bookings_on_slot_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.string "favoritable_type"
    t.bigint "favoritable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "prof_id"
    t.index ["favoritable_type", "favoritable_id"], name: "index_favorites_on_favoritable_type_and_favoritable_id"
    t.index ["prof_id"], name: "index_favorites_on_prof_id"
  end

  create_table "friend_jobs", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "rate", precision: 8, scale: 2
    t.bigint "friend_id"
    t.integer "slot_num"
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
    t.float "latitude"
    t.float "longitude"
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
    t.string "bio"
    t.string "phone"
    t.string "publishable_key"
    t.string "provider"
    t.string "uid"
    t.string "access_code"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.index ["email"], name: "index_profs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_profs_on_reset_password_token", unique: true
  end

  create_table "slots", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "available", default: true
    t.string "reservable_type"
    t.bigint "reservable_id"
    t.index ["reservable_type", "reservable_id"], name: "index_slots_on_reservable_type_and_reservable_id"
  end

  add_foreign_key "bookings", "profs"
  add_foreign_key "bookings", "slots"
  add_foreign_key "favorites", "profs"
  add_foreign_key "jobs", "hospitals"
end
