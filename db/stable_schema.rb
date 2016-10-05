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

ActiveRecord::Schema.define(version: 20160905233727) do

  create_table "agent", primary_key: "agent_id", force: :cascade do |t|
    t.integer "company_id", limit: 4,  null: false
    t.string  "name",       limit: 40, null: false
    t.string  "mobile",     limit: 30, null: false
    t.string  "email",      limit: 30, null: false
  end

  add_index "agent", ["company_id"], name: "fk_agent_company", using: :btree

  create_table "company", primary_key: "company_id", force: :cascade do |t|
    t.string  "name",                limit: 50, null: false
    t.string  "description",         limit: 80, null: false
    t.string  "address_1",           limit: 50
    t.string  "address_2",           limit: 50
    t.string  "address_city",        limit: 50
    t.string  "address_postcode",    limit: 50
    t.string  "address_state",       limit: 50
    t.string  "address_country",     limit: 50
    t.integer "tech_contact_id",     limit: 4
    t.integer "business_contact_id", limit: 4
  end

  create_table "config", primary_key: "config_id", force: :cascade do |t|
    t.string "constant",    limit: 50,  null: false
    t.string "value",       limit: 100, null: false
    t.string "description", limit: 500, null: false
  end

  create_table "content", primary_key: "content_id", force: :cascade do |t|
    t.integer "content_type_id",  limit: 4,                       null: false
    t.string  "content_name",     limit: 45
    t.integer "external_data",    limit: 4,   default: 0,         null: false
    t.string  "sef_name",         limit: 100, default: "content"
    t.integer "access_level",     limit: 4,   default: 100,       null: false
    t.integer "cm_sorting_index", limit: 4,   default: 0,         null: false
  end

  add_index "content", ["cm_sorting_index"], name: "cm_sorting_index", using: :btree
  add_index "content", ["content_id", "content_type_id", "sef_name"], name: "idx_for_cache_model_related_scenes", using: :btree
  add_index "content", ["content_type_id"], name: "fk_content_content_type", using: :btree
  add_index "content", ["external_data"], name: "in_external_data", using: :btree
  add_index "content", ["sef_name"], name: "sef_name", using: :btree

  create_table "content_type", primary_key: "content_type_id", force: :cascade do |t|
    t.string "name",     limit: 20, null: false
    t.string "constant", limit: 45, null: false
  end

  create_table "model", primary_key: "model_id", force: :cascade do |t|
    t.integer  "agent_id",            limit: 4
    t.integer  "company_id",          limit: 4,                 null: false
    t.integer  "content_id",          limit: 4
    t.integer  "country_id",          limit: 4,                 null: false
    t.integer  "model_status_id",     limit: 4
    t.string   "public",              limit: 1,   default: "1", null: false
    t.datetime "created",                                       null: false
    t.datetime "birth_date"
    t.integer  "first_debute",        limit: 4
    t.string   "first_name",          limit: 30,                null: false
    t.string   "middle_name",         limit: 30,                null: false
    t.string   "last_name",           limit: 30,                null: false
    t.string   "name",                limit: 45,                null: false
    t.string   "city",                limit: 30,                null: false
    t.string   "mobile",              limit: 30,                null: false
    t.string   "email",               limit: 30,                null: false
    t.string   "description",         limit: 30,                null: false
    t.string   "sex",                 limit: 6
    t.string   "bust_size",           limit: 1
    t.string   "hair_color",          limit: 6
    t.string   "hair_length",         limit: 6
    t.string   "height",              limit: 3
    t.string   "weight",              limit: 2
    t.string   "shoe",                limit: 2
    t.string   "race",                limit: 8
    t.string   "work_rating",         limit: 2
    t.string   "payment",             limit: 5
    t.string   "skin_color",          limit: 5
    t.string   "source_url",          limit: 512,               null: false
    t.datetime "source_last_updated"
    t.integer  "external_data",       limit: 4,   default: 0,   null: false
    t.string   "forum_thread_url",    limit: 256
    t.integer  "user_id",             limit: 4,                 null: false
  end

  add_index "model", ["agent_id"], name: "fk_model_agent", using: :btree
  add_index "model", ["company_id"], name: "fk_model_company", using: :btree
  add_index "model", ["content_id", "model_id"], name: "fk_model_content", using: :btree
  add_index "model", ["content_id"], name: "content_id", unique: true, using: :btree
  add_index "model", ["country_id"], name: "fk_model_country", using: :btree
  add_index "model", ["external_data"], name: "in_external_data", using: :btree
  add_index "model", ["user_id"], name: "fk_model_user", using: :btree

  create_table "permission_group", primary_key: "permission_group_id", force: :cascade do |t|
    t.string "name",             limit: 45,                            null: false
    t.string "description",      limit: 255,                           null: false
    t.string "permission_scope", limit: 13,  default: "internal_user", null: false
  end

  create_table "scene", primary_key: "scene_id", force: :cascade do |t|
    t.integer  "user_id",                  limit: 4,                                             null: false
    t.integer  "editor_id",                limit: 4
    t.integer  "company_id",               limit: 4,                                             null: false
    t.integer  "content_id",               limit: 4,                                             null: false
    t.integer  "line_id",                  limit: 4,                                             null: false
    t.integer  "director_id",              limit: 4,                                             null: false
    t.integer  "studio_id",                limit: 4
    t.integer  "link_scene_status_id",     limit: 4
    t.datetime "created",                                                                        null: false
    t.string   "tape",                     limit: 20
    t.string   "director_rating",          limit: 2
    t.string   "director_comment",         limit: 100
    t.string   "seo_title",                limit: 128
    t.string   "small_description",        limit: 200,                                           null: false
    t.string   "big_description",          limit: 400,                                           null: false
    t.text     "keywords",                 limit: 65535
    t.text     "talents",                  limit: 65535
    t.string   "bts_description",          limit: 400
    t.string   "behind_info",              limit: 400,                                           null: false
    t.date     "date_of_production"
    t.time     "runtime"
    t.integer  "cost",                     limit: 4,                                             null: false
    t.decimal  "sales_at_day_100",                       precision: 8, scale: 2,                 null: false
    t.decimal  "sales_at_day_547",                       precision: 8, scale: 2,                 null: false
    t.string   "name",                     limit: 128,                                           null: false
    t.integer  "external_data",            limit: 4,                             default: 0,     null: false
    t.boolean  "need_to_extract_metadata", limit: 1,                             default: false, null: false
  end

  add_index "scene", ["company_id"], name: "fk_scene_company", using: :btree
  add_index "scene", ["content_id", "scene_id", "name"], name: "content_id", unique: true, using: :btree
  add_index "scene", ["content_id"], name: "fk_scene_content", unique: true, using: :btree
  add_index "scene", ["director_id"], name: "fk_scene_director", using: :btree
  add_index "scene", ["external_data"], name: "in_external_data", using: :btree
  add_index "scene", ["line_id"], name: "fk_scene_line", using: :btree
  add_index "scene", ["scene_id", "name"], name: "idx_for_cache_model_related_scenes", using: :btree
  add_index "scene", ["studio_id"], name: "fk_scene_studio", using: :btree
  add_index "scene", ["user_id"], name: "fk_scene_user", using: :btree

  create_table "scene_genre", primary_key: "scene_genre_id", force: :cascade do |t|
    t.integer "company_id",    limit: 4,              null: false
    t.string  "name",          limit: 45,             null: false
    t.string  "public",        limit: 1
    t.integer "external_data", limit: 4,              null: false
    t.integer "sweetness",     limit: 1,  default: 1, null: false
  end

  add_index "scene_genre", ["company_id"], name: "fk_scene_category_company", using: :btree
  add_index "scene_genre", ["external_data"], name: "in_external_data", using: :btree

  create_table "scene_keywords", primary_key: "scene_keywords_id", force: :cascade do |t|
    t.integer "company_id", limit: 4,   null: false
    t.string  "name",       limit: 250, null: false
    t.string  "public",     limit: 1
  end

  add_index "scene_keywords", ["company_id"], name: "fk_scene_keywords_company", using: :btree

  create_table "storage", primary_key: "storage_id", force: :cascade do |t|
    t.integer "storage_priority",         limit: 4,                                    null: false
    t.string  "media_type",               limit: 5,                                    null: false
    t.string  "storage_url",              limit: 45,                                   null: false
    t.integer "subpath1_counter",         limit: 4,                                    null: false
    t.integer "subpath2_threshold",       limit: 4,                                    null: false
    t.integer "subpath2_counter",         limit: 4,                                    null: false
    t.integer "used_space_mb",            limit: 4,  default: 0,                       null: false
    t.integer "free_space_mb",            limit: 4,  default: 0,                       null: false
    t.integer "minimum_free_space_mb",    limit: 4,  default: 1000,                    null: false
    t.string  "status",                   limit: 7,  default: "free",                  null: false
    t.string  "licensing_memcache_queue", limit: 45, default: "encoder_v1_common_job", null: false
    t.string  "allow_encoding_on_demand", limit: 3,  default: "yes",                   null: false
  end

  add_index "storage", ["storage_id", "storage_url"], name: "idx_for_cache_model_related_scenes", using: :btree

  create_table "user", primary_key: "user_id", force: :cascade do |t|
    t.integer  "permission_group_id", limit: 4,                   null: false
    t.integer  "company_id",          limit: 4,                   null: false
    t.string   "username",            limit: 50,                  null: false
    t.string   "password",            limit: 40,                  null: false
    t.string   "name",                limit: 50,                  null: false
    t.string   "surname",             limit: 50,                  null: false
    t.string   "email",               limit: 80,                  null: false
    t.string   "phone",               limit: 80
    t.string   "mobile_phone",        limit: 80
    t.string   "description",         limit: 80,                  null: false
    t.string   "enabled",             limit: 3,   default: "yes", null: false
    t.string   "disabled",            limit: 1,                   null: false
    t.datetime "created",                                         null: false
    t.datetime "last_login",                                      null: false
    t.integer  "language",            limit: 4,                   null: false
    t.string   "ftp_password",        limit: 60,                  null: false
    t.integer  "ftp_uid",             limit: 4,                   null: false
    t.integer  "ftp_gid",             limit: 4,                   null: false
    t.string   "ftp_homedir",         limit: 50,                  null: false
    t.string   "ftp_shell",           limit: 20,                  null: false
    t.datetime "ftp_expiration",                                  null: false
    t.datetime "ftp_lastlogin",                                   null: false
    t.datetime "ftp_lastlogout",                                  null: false
    t.integer  "ftp_count",           limit: 4,                   null: false
    t.string   "reg_ip",              limit: 100
    t.string   "reg_ip_location",     limit: 200
    t.string   "hide_poll",           limit: 3,   default: "NO",  null: false
  end

  add_index "user", ["username"], name: "username_UNIQUE", unique: true, using: :btree

end
