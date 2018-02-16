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

ActiveRecord::Schema.define(version: 20180215192326) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidate_masters", force: :cascade do |t|
    t.string   "voter_id"
    t.string   "portfolio_id"
    t.integer  "user_id"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "slot_id"
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
    t.string   "department_id"
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
    t.integer  "gender_id"
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