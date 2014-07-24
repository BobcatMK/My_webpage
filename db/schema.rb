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

ActiveRecord::Schema.define(version: 20140724080930) do

  create_table "contactinfos", force: true do |t|
    t.string   "name_surname"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "email_address"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "main_hierarchies", id: false, force: true do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
  end

  add_index "main_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "comment_anc_desc_udx", unique: true
  add_index "main_hierarchies", ["descendant_id"], name: "comment_desc_idx"

  create_table "mains", force: true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_url"
    t.integer  "parent_id"
    t.integer  "post_id"
    t.integer  "post_motivation_id"
  end

  create_table "mystories", force: true do |t|
    t.string   "name"
    t.text     "body"
    t.string   "picture1"
    t.string   "picture2"
    t.string   "picture3"
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "short_description"
    t.text     "long_description"
    t.string   "affiliate_link"
    t.string   "picture1"
    t.string   "picture2"
    t.string   "picture3"
    t.string   "picture4"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "author"
    t.decimal  "price"
  end

  create_table "projectsabouts", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "picture1"
    t.string   "picture2"
    t.string   "picture3"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture4"
  end

end
