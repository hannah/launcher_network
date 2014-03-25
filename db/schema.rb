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

ActiveRecord::Schema.define(version: 20140325201640) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.integer  "user_id",    null: false
    t.text     "body",       null: false
    t.integer  "post_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interest_groups", force: true do |t|
    t.string   "name",        null: false
    t.string   "null"
    t.string   "false"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator",     null: false
  end

  create_table "memberships", force: true do |t|
    t.integer "user_id",           null: false
    t.integer "interest_group_id", null: false
  end

  create_table "posts", force: true do |t|
    t.integer "user_id"
    t.string  "title"
    t.text    "body",    null: false
  end

  create_table "songs", force: true do |t|
    t.string   "title"
    t.string   "album"
    t.string   "artist"
    t.integer  "year"
    t.string   "label"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name", null: false
    t.string   "last_name",  null: false
    t.string   "email",      null: false
    t.string   "role",       null: false
    t.text     "fun_fact"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
