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

ActiveRecord::Schema.define(version: 20150316030626) do

  create_table "albums", force: true do |t|
    t.integer "user_id"
    t.string  "name",    null: false
    t.string  "token"
  end

  add_index "albums", ["token"], name: "index_albums_on_token", unique: true

  create_table "pages", force: true do |t|
    t.integer "album_id"
    t.integer "layout",   null: false
    t.string  "token"
  end

  add_index "pages", ["token"], name: "index_pages_on_token", unique: true

  create_table "photos", force: true do |t|
    t.integer "page_id"
    t.string  "url"
    t.string  "shape"
    t.integer "offset_left", default: 0
    t.integer "offset_top",  default: 0
  end

  create_table "quotes", force: true do |t|
    t.integer "page_id"
    t.text    "content"
    t.string  "justify"
    t.integer "size"
  end

  create_table "users", force: true do |t|
    t.string "name",            null: false
    t.string "email",           null: false
    t.string "password_digest", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
