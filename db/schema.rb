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

ActiveRecord::Schema.define(version: 20171005040815) do

  create_table "messages", force: :cascade do |t|
    t.string  "subject"
    t.string  "body"
    t.string  "invite_code"
    t.integer "sender_id"
    t.integer "recipient_id"
    t.boolean "read_status",  default: false
    t.date    "send_date"
    t.boolean "flagged",      default: false
    t.integer "user_id"
  end

  create_table "project_roles", force: :cascade do |t|
    t.integer "project_id"
    t.integer "role_id"
    t.integer "user_id"
    t.integer "invite_num"
  end

  create_table "projects", force: :cascade do |t|
    t.integer "user_id"
    t.string  "proj_description"
    t.string  "genre"
    t.string  "title"
    t.date    "start_date"
    t.date    "end_date"
    t.string  "category"
    t.string  "status",           default: "active"
    t.string  "preview_level",    default: "hidden"
  end

  create_table "roles", force: :cascade do |t|
    t.string  "name"
    t.boolean "active", default: true
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "phone_number"
    t.string   "username"
    t.boolean  "active",           default: true
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
  end

end
