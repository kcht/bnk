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

ActiveRecord::Schema.define(version: 20170418220723) do

  create_table "articles", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "text",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "programs", force: :cascade do |t|
    t.integer  "number",      limit: 4
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.date     "airing_date"
  end

  create_table "songs", force: :cascade do |t|
    t.string  "title",      limit: 255
    t.string  "artist",     limit: 255
    t.string  "album",      limit: 255
    t.integer "year",       limit: 4
    t.integer "program_id", limit: 4
  end

  add_index "songs", ["program_id"], name: "index_songs_on_program_id", using: :btree

  add_foreign_key "songs", "programs"
end
