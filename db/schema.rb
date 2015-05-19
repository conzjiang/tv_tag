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

ActiveRecord::Schema.define(version: 20150519203657) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "markers", force: :cascade do |t|
    t.integer  "page"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "markers", ["category"], name: "index_markers_on_category", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "tv_show_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taggings", ["tag_id", "tv_show_id"], name: "index_taggings_on_tag_id_and_tv_show_id", unique: true, using: :btree
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["tv_show_id"], name: "index_taggings_on_tv_show_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", using: :btree

  create_table "tv_shows", force: :cascade do |t|
    t.integer  "tmdb_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tv_shows", ["title"], name: "index_tv_shows_on_title", using: :btree
  add_index "tv_shows", ["tmdb_id"], name: "index_tv_shows_on_tmdb_id", using: :btree

end
