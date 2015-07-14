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

ActiveRecord::Schema.define(version: 20150617124020) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "artist_name"
    t.string   "album_title"
    t.string   "label_name"
    t.integer  "num_cat"
    t.integer  "delivery_price"
    t.string   "status"
    t.integer  "total_price"
    t.integer  "quantity"
    t.integer  "format"
    t.integer  "ingraving"
    t.integer  "vinyl_colors"
    t.integer  "label"
    t.integer  "external_sleeve"
    t.integer  "sleeve"
    t.integer  "packaging"
    t.integer  "weight"
    t.integer  "pack_id"
    t.integer  "client_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "orders", ["client_id"], name: "index_orders_on_client_id", using: :btree
  add_index "orders", ["pack_id"], name: "index_orders_on_pack_id", using: :btree

  create_table "pack_translations", force: :cascade do |t|
    t.integer  "pack_id",     null: false
    t.string   "locale",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
    t.text     "description", null: false
  end

  add_index "pack_translations", ["locale"], name: "index_pack_translations_on_locale", using: :btree
  add_index "pack_translations", ["pack_id"], name: "index_pack_translations_on_pack_id", using: :btree

  create_table "packs", force: :cascade do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "quantity"
    t.integer  "format"
    t.integer  "ingraving"
    t.integer  "vinyl_colors"
    t.integer  "label"
    t.integer  "external_sleeve"
    t.integer  "sleeve"
    t.integer  "packaging"
    t.integer  "weight"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "orders", "clients"
  add_foreign_key "orders", "packs"
end
