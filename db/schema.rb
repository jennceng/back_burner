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

ActiveRecord::Schema.define(version: 20160420153631) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chefs", force: :cascade do |t|
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
    t.string   "phone_number",                        null: false
    t.string   "restaurant_name",                     null: false
    t.string   "address",                             null: false
    t.string   "city",                                null: false
    t.string   "state",                               null: false
    t.string   "zip",                                 null: false
    t.string   "description"
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "chefs", ["email"], name: "index_chefs_on_email", unique: true, using: :btree
  add_index "chefs", ["reset_password_token"], name: "index_chefs_on_reset_password_token", unique: true, using: :btree

  create_table "cooks", force: :cascade do |t|
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
    t.string   "phone_number",                        null: false
    t.string   "description"
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "cooks", ["email"], name: "index_cooks_on_email", unique: true, using: :btree
  add_index "cooks", ["reset_password_token"], name: "index_cooks_on_reset_password_token", unique: true, using: :btree

  create_table "posts", force: :cascade do |t|
    t.integer  "chef_id",                    null: false
    t.integer  "cook_id"
    t.string   "date",                       null: false
    t.string   "start_time",                 null: false
    t.string   "end_time",                   null: false
    t.string   "wage",                       null: false
    t.string   "description"
    t.boolean  "open",        default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "signups", force: :cascade do |t|
    t.integer "post_id",                      null: false
    t.integer "cook_id",                      null: false
    t.string  "decision", default: "Pending"
  end

end
