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

ActiveRecord::Schema.define(version: 20131026005726) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "allergies", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "allergies_members", id: false, force: true do |t|
    t.integer "allergy_id"
    t.integer "member_id"
  end

  add_index "allergies_members", ["allergy_id"], name: "index_allergies_members_on_allergy_id", using: :btree
  add_index "allergies_members", ["member_id", "allergy_id"], name: "index_allergies_members_on_member_id_and_allergy_id", using: :btree
  add_index "allergies_members", ["member_id"], name: "index_allergies_members_on_member_id", using: :btree

  create_table "cookbooks", force: true do |t|
    t.string  "name"
    t.integer "user_id"
  end

  create_table "diets", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "diets_members", id: false, force: true do |t|
    t.integer "diet_id"
    t.integer "member_id"
  end

  add_index "diets_members", ["diet_id"], name: "index_diets_members_on_diet_id", using: :btree
  add_index "diets_members", ["member_id", "diet_id"], name: "index_diets_members_on_member_id_and_diet_id", using: :btree
  add_index "diets_members", ["member_id"], name: "index_diets_members_on_member_id", using: :btree

  create_table "members", force: true do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "gender"
    t.integer  "user_id"
    t.text     "xingredlist"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipes", force: true do |t|
    t.string  "name"
    t.text    "ingredient_list"
    t.text    "image"
    t.text    "link"
    t.integer "rating"
    t.integer "time"
    t.text    "note"
  end

  create_table "searches", force: true do |t|
    t.string  "name"
    t.text    "ingredlist"
    t.text    "allergy"
    t.text    "diet"
    t.text    "xingredlist"
    t.text    "course"
    t.integer "max_time"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
