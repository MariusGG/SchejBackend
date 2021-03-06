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

ActiveRecord::Schema.define(version: 2018_12_17_150435) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "emergency_requests", force: :cascade do |t|
    t.integer "emergency_requester_id"
    t.text "comment"
    t.integer "emergency_shift_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requests", force: :cascade do |t|
    t.integer "shift_requester_id"
    t.integer "shift_holder_id"
    t.text "comment"
    t.integer "requested_shift_id"
    t.integer "current_shift_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shifts", force: :cascade do |t|
    t.string "title"
    t.string "start_time"
    t.string "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "organisation"
    t.string "email"
    t.string "job_title"
    t.index ["user_id"], name: "index_shifts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "authentication_token"
    t.string "name"
    t.string "mobile"
    t.string "organisation"
    t.string "job_title"
    t.index ["authentication_token"], name: "index_users_on_authentication_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "emergency_requests", "shifts", column: "emergency_shift_id"
  add_foreign_key "emergency_requests", "users", column: "emergency_requester_id"
  add_foreign_key "requests", "shifts", column: "current_shift_id"
  add_foreign_key "requests", "shifts", column: "requested_shift_id"
  add_foreign_key "requests", "users", column: "shift_holder_id"
  add_foreign_key "requests", "users", column: "shift_requester_id"
  add_foreign_key "shifts", "users"
end
