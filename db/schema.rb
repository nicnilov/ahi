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

ActiveRecord::Schema.define(version: 20151002200234) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aircrafts", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "conceived_at"
    t.datetime "flown_at"
    t.datetime "introduced_at"
    t.datetime "retired_at"
    t.datetime "produced_since"
    t.datetime "produced_till"
    t.integer  "number_built"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "alias"
    t.string   "variant_type",   null: false
  end

  add_index "aircrafts", ["name", "variant_type"], name: "aircrafts_unique", unique: true, using: :btree
  add_index "aircrafts", ["variant_type"], name: "index_aircrafts_on_variant_type", using: :btree

  create_table "aircrafts_manufacturers", id: false, force: :cascade do |t|
    t.integer "aircraft_id",     null: false
    t.integer "manufacturer_id", null: false
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string   "name"
    t.string   "full_name"
    t.string   "slug"
    t.datetime "founded_at"
    t.datetime "defunct_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "variants", force: :cascade do |t|
    t.integer "aircraft_id", null: false
    t.integer "variant_id",  null: false
  end

end
