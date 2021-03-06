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

ActiveRecord::Schema.define(version: 20160312042534) do

  create_table "activities", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "location"
    t.string   "image"
    t.integer  "c_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "activity_advs", force: :cascade do |t|
    t.integer  "a_id",       null: false
    t.integer  "a_type",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "match_id"
    t.integer  "team_1"
    t.integer  "team_2"
    t.integer  "team_1_score"
    t.integer  "team_2_score"
    t.integer  "winner"
    t.integer  "loser"
    t.integer  "time"
    t.string   "location"
    t.integer  "t_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "type",         default: 0,  null: false
    t.integer  "author",       default: -1, null: false
    t.text     "notification",              null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "team_name"
    t.string   "team_contact_name"
    t.integer  "team_phone_nr"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "user_id"
  end

  add_index "teams", ["team_name"], name: "index_teams_on_team_name", unique: true
  add_index "teams", ["user_id"], name: "index_teams_on_user_id"

  create_table "tournaments", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "status"
    t.string   "location"
    t.integer  "type"
    t.string   "time_start"
    t.string   "time_end"
    t.string   "time_start_act"
    t.string   "time_end_act"
    t.integer  "max_teams"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "user_notifications", force: :cascade do |t|
    t.integer  "notification_id",             null: false
    t.integer  "user_id",                     null: false
    t.integer  "status",          default: 0, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "surname"
    t.string   "phone_number"
    t.string   "country"
    t.string   "city"
    t.string   "address"
    t.string   "username"
    t.string   "password"
    t.string   "salt"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.boolean  "admin",                  default: false
    t.integer  "shopping_p",             default: 0,     null: false
    t.integer  "adventure_p",            default: 0,     null: false
    t.integer  "sightseing_p",           default: 0,     null: false
    t.integer  "nightlife_p",            default: 0,     null: false
    t.integer  "winter_p",               default: 0,     null: false
    t.integer  "beach_p",                default: 0,     null: false
    t.integer  "history_p",              default: 0,     null: false
    t.integer  "architecture_p",         default: 0,     null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true

end
