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

ActiveRecord::Schema.define(version: 0) do

  create_table "action_event", primary_key: "action_event_id", force: :cascade do |t|
    t.text     "name",        limit: 65535, null: false
    t.string   "script_name", limit: 100,   null: false
    t.datetime "created",                   null: false
  end

  create_table "action_event_log", primary_key: "action_event_log_id", force: :cascade do |t|
    t.integer  "action_event_id", limit: 4,     null: false
    t.string   "table",           limit: 65,    null: false
    t.string   "action",          limit: 6,     null: false
    t.integer  "id",              limit: 4,     null: false
    t.text     "data",            limit: 65535
    t.datetime "created",                       null: false
  end

  add_index "action_event_log", ["action_event_id"], name: "action_event_id", using: :btree

  create_table "migration", primary_key: "version", force: :cascade do |t|
    t.integer "apply_time", limit: 4
  end

  create_table "rest_query", primary_key: "rest_query_id", force: :cascade do |t|
    t.datetime "created",                              null: false
    t.string   "user",                   limit: 16
    t.integer  "process",                limit: 4
    t.integer  "source_website_id",      limit: 4
    t.integer  "destination_website_id", limit: 4
    t.string   "method",                 limit: 8
    t.string   "action",                 limit: 32
    t.string   "url",                    limit: 255,   null: false
    t.text     "params",                 limit: 65535, null: false
    t.text     "response",               limit: 65535
    t.integer  "runtime",                limit: 3
  end

  add_index "rest_query", ["destination_website_id"], name: "destination_website_id", using: :btree
  add_index "rest_query", ["source_website_id"], name: "source_website_id", using: :btree

  # create_table "website", primary_key: "website_id", force: :cascade do |t|
  #   t.integer "content_id",              limit: 4,                         null: false
  #   t.string  "shortname",               limit: 45
  #   t.string  "shortcode",               limit: 2
  #   t.string  "name",                    limit: 30,                        null: false
  #   t.string  "description",             limit: 45,                        null: false
  #   t.string  "url",                     limit: 70,                        null: false
  #   t.string  "logo",                    limit: 50
  #   t.string  "main_gallery_page",       limit: 45
  #   t.string  "registration_enabled",    limit: 12,    default: "no",      null: false
  #   t.string  "template_class",          limit: 45
  #   t.string  "delegated_login_enabled", limit: 1,     default: "0",       null: false
  #   t.string  "type",                    limit: 8,     default: "paysite", null: false
  #   t.string  "is_active",               limit: 3,     default: "yes",     null: false
  #   t.string  "use_by_landing_pages",    limit: 3,     default: "no",      null: false
  #   t.text    "json_params",             limit: 65535
  #   t.string  "constant",                limit: 45,                        null: false
  #   t.string  "watermark",               limit: 45
  #   t.string  "status",                  limit: 8,     default: "active",  null: false
  # end

  # add_index "website", ["constant"], name: "idx_constant_unique", unique: true, using: :btree
  # add_index "website", ["content_id"], name: "content_id", using: :btree

  create_table "website_country_discount", primary_key: "website_country_discount_id", force: :cascade do |t|
    t.integer "website_id",     limit: 4,  null: false
    t.integer "country_id",     limit: 4,  null: false
    t.float   "discount_level", limit: 24, null: false
  end

  add_index "website_country_discount", ["country_id"], name: "fk_website_country_discount_country", using: :btree
  add_index "website_country_discount", ["website_id"], name: "fk_website_country_discount_website", using: :btree

  create_table "website_user_activation_log", primary_key: "website_user_activation_log_id", force: :cascade do |t|
    t.datetime "date",                      null: false
    t.string   "url",         limit: 256,   null: false
    t.text     "description", limit: 65535, null: false
  end

  add_foreign_key "action_event_log", "action_event", primary_key: "action_event_id", name: "action_event_log_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "country", "currency", primary_key: "currency_id", name: "country_ibfk_1"
  add_foreign_key "rest_query", "website", column: "destination_website_id", primary_key: "website_id", name: "rest_query_ibfk_2"
  add_foreign_key "rest_query", "website", column: "source_website_id", primary_key: "website_id", name: "rest_query_ibfk_1"
end
