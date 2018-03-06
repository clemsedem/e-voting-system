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

ActiveRecord::Schema.define(version: 20180306130758) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidate_masters", force: :cascade do |t|
    t.string   "voter_id"
    t.string   "portfolio_id"
    t.integer  "user_id"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "slot_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "department_masters", force: :cascade do |t|
    t.string   "department_name"
    t.integer  "faculty_id"
    t.integer  "user_id"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "faculty_masters", force: :cascade do |t|
    t.string   "faculty_name"
    t.integer  "user_id"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "gender_masters", force: :cascade do |t|
    t.string   "gender"
    t.integer  "user_id"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "level_masters", force: :cascade do |t|
    t.integer  "level"
    t.integer  "user_id"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "models", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "user"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "models", ["email"], name: "index_models_on_email", unique: true, using: :btree
  add_index "models", ["reset_password_token"], name: "index_models_on_reset_password_token", unique: true, using: :btree

  create_table "portfolio_masters", force: :cascade do |t|
    t.string   "ref_id"
    t.string   "portfolio"
    t.integer  "user_id"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "program_masters", force: :cascade do |t|
    t.string   "program_name"
    t.integer  "department_id"
    t.integer  "user_id"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "registered_voters", force: :cascade do |t|
    t.string   "voter_id"
    t.string   "surname"
    t.string   "other_names"
    t.integer  "level_id"
    t.integer  "session_id"
    t.integer  "program_id"
    t.string   "gender"
    t.boolean  "vote_status"
    t.integer  "user_id"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "session_masters", force: :cascade do |t|
    t.string   "session"
    t.integer  "user_id"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: ""
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "surname"
    t.string   "other_names"
    t.string   "username"
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vote_results", force: :cascade do |t|
    t.string   "portfolio_id"
    t.string   "voter_id"
    t.integer  "candidate_id"
    t.integer  "user_id"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "voter_tokens", force: :cascade do |t|
    t.string   "voter_id"
    t.string   "token"
    t.integer  "user_id"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
