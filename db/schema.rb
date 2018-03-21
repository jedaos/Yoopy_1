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

ActiveRecord::Schema.define(version: 20180321185400) do

  create_table "bookings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "slot_id"
    t.integer "prof_id"
    t.index ["prof_id"], name: "index_bookings_on_prof_id"
    t.index ["slot_id"], name: "index_bookings_on_slot_id"
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
    t.integer "hospital_id"
    t.string "slot_num"
    t.index ["hospital_id"], name: "index_jobs_on_hospital_id"
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
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.index ["email"], name: "index_profs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_profs_on_reset_password_token", unique: true
  end

  create_table "slots", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "job_id"
    t.index ["job_id"], name: "index_slots_on_job_id"
  end

end
