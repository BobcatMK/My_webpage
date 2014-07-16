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

ActiveRecord::Schema.define(version: 20140716083422) do

  create_table "main_hierarchies", id: false, force: true do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
  end

  add_index "main_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "comment_anc_desc_udx", unique: true
  add_index "main_hierarchies", ["descendant_id"], name: "comment_desc_idx"

  create_table "mains", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_url"
    t.integer  "parent_id"
  end

  create_table "post_motivations", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.text     "short"
    t.string   "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.text     "short"
    t.string   "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
