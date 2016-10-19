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

ActiveRecord::Schema.define(version: 20160923030850) do

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

  create_table "content_price_rate", primary_key: "content_price_rate_id", force: :cascade do |t|
    t.integer "content_id",                limit: 4,                 null: false
    t.float   "rate",                      limit: 24,                null: false
    t.string  "is_free_for_members",       limit: 3,  default: "no", null: false
    t.string  "is_available_for_free_tkt", limit: 3,  default: "no", null: false
    t.integer "automatic",                 limit: 1,                 null: false
  end

  add_index "content_price_rate", ["content_id"], name: "content_id", unique: true, using: :btree

  create_table "content_release", primary_key: "content_release_id", force: :cascade do |t|
    t.integer  "website_id",          limit: 4,                    null: false
    t.integer  "content_id",          limit: 4,                    null: false
    t.datetime "date",                                             null: false
    t.integer  "views",               limit: 4,                    null: false
    t.integer  "paid_views",          limit: 4,  default: 0,       null: false
    t.integer  "last_week_views",     limit: 4,  default: 0,       null: false
    t.integer  "downloads",           limit: 4,                    null: false
    t.integer  "last_week_downloads", limit: 4,  default: 0,       null: false
    t.datetime "release_created",                                  null: false
    t.integer  "external_data",       limit: 4,                    null: false
    t.integer  "sorting_index",       limit: 4,  default: 0,       null: false
    t.integer  "ratings",             limit: 4,  default: 0,       null: false
    t.float    "average_rating",      limit: 24, default: 0.0,     null: false
    t.string   "created_by",          limit: 5,  default: "admin", null: false
  end

  add_index "content_release", ["content_id", "website_id", "content_release_id"], name: "idx_for_cache_model_related_scenes", using: :btree
  add_index "content_release", ["content_id"], name: "fk_content_release_content", using: :btree
  add_index "content_release", ["external_data"], name: "in_external_data", using: :btree
  add_index "content_release", ["website_id", "content_id"], name: "unique_release_on_site", unique: true, using: :btree
  add_index "content_release", ["website_id"], name: "fk_content_release_website", using: :btree

  create_table "content_type", primary_key: "content_type_id", force: :cascade do |t|
    t.string "name",     limit: 20, null: false
    t.string "constant", limit: 45, null: false
  end

  create_table "director", primary_key: "director_id", force: :cascade do |t|
    t.integer "company_id", limit: 4,  null: false
    t.string  "name",       limit: 30, null: false
    t.string  "public",     limit: 1,  null: false
  end

  add_index "director", ["company_id"], name: "fk_director_company", using: :btree

  create_table "encoder_server", primary_key: "encoder_server_id", force: :cascade do |t|
    t.string "name",        limit: 20,                  null: false
    t.string "description", limit: 200,                 null: false
    t.string "status",      limit: 4,                   null: false
    t.string "is_usable",   limit: 3,   default: "yes", null: false
  end

  create_table "file_object_type", primary_key: "file_object_type_id", force: :cascade do |t|
    t.integer "content_type_id",               limit: 4
    t.integer "secondary_content_type_id",     limit: 4
    t.string  "media_type",                    limit: 5,                  null: false
    t.integer "file_object_type_family_id",    limit: 4,   default: 1000, null: false
    t.string  "name",                          limit: 30,                 null: false
    t.string  "constant",                      limit: 45,                 null: false
    t.string  "description",                   limit: 100,                null: false
    t.string  "share_files",                   limit: 3,   default: "no", null: false
    t.string  "wm_embedding",                  limit: 3,   default: "no", null: false
    t.integer "fetch_video_duration_priority", limit: 1
  end

  add_index "file_object_type", ["constant"], name: "constant", using: :btree
  add_index "file_object_type", ["content_type_id"], name: "fk_file_object_type_content_type", using: :btree
  add_index "file_object_type", ["file_object_type_family_id"], name: "fk_file_object_type_file_object_type_family1", using: :btree
  add_index "file_object_type", ["secondary_content_type_id"], name: "secondary_content_type", using: :btree

  create_table "file_object_type_family", primary_key: "file_object_type_family_id", force: :cascade do |t|
    t.string "name",        limit: 30,  null: false
    t.string "constant",    limit: 45,  null: false
    t.string "description", limit: 100
    t.string "category",    limit: 11
  end

  add_index "file_object_type_family", ["file_object_type_family_id"], name: "file_object_type_family_id", unique: true, using: :btree

  create_table "gtf_videos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "image", primary_key: "image_id", force: :cascade do |t|
    t.integer  "upload_id",            limit: 4,                     null: false
    t.integer  "file_object_type_id",  limit: 4,                     null: false
    t.integer  "company_id",           limit: 4,                     null: false
    t.integer  "user_id",              limit: 4,                     null: false
    t.integer  "content_id",           limit: 4
    t.integer  "storage_id",           limit: 4,                     null: false
    t.string   "subpath",              limit: 20,                    null: false
    t.string   "url",                  limit: 45,                    null: false
    t.integer  "image_order",          limit: 4,                     null: false
    t.datetime "created",                                            null: false
    t.string   "status",               limit: 7,  default: "active", null: false
    t.integer  "source_video_file_id", limit: 4
    t.float    "screenshots_rate",     limit: 24
  end

  add_index "image", ["company_id"], name: "fk_image_company", using: :btree
  add_index "image", ["content_id", "subpath", "file_object_type_id", "image_id", "storage_id"], name: "idx_for_cache_model_related_scenes", using: :btree
  add_index "image", ["content_id"], name: "fk_image_content", using: :btree
  add_index "image", ["file_object_type_id"], name: "fk_image_file_object_type", using: :btree
  add_index "image", ["status"], name: "status", using: :btree
  add_index "image", ["storage_id"], name: "fk_image_storage", using: :btree
  add_index "image", ["upload_id"], name: "fk_image_upload", using: :btree
  add_index "image", ["user_id"], name: "fk_image_user", using: :btree

  create_table "image_encoded", primary_key: "image_encoded_id", force: :cascade do |t|
    t.integer  "image_id",          limit: 4,    null: false
    t.integer  "image_encoding_id", limit: 4,    null: false
    t.integer  "encoder_server_id", limit: 4,    null: false
    t.datetime "encode_start",                   null: false
    t.datetime "encode_finish",                  null: false
    t.string   "encode_status",     limit: 10,   null: false
    t.string   "encode_log",        limit: 1000, null: false
  end

  add_index "image_encoded", ["encoder_server_id"], name: "fk_image_encoded_encoder_server", using: :btree
  add_index "image_encoded", ["image_encoding_id"], name: "image_encoding_id", using: :btree
  add_index "image_encoded", ["image_id"], name: "fk_image_encoded_image", using: :btree

  create_table "image_encoding", primary_key: "image_encoding_id", force: :cascade do |t|
    t.integer "upload_extension_id", limit: 4,                 null: false
    t.string  "name",                limit: 30,                null: false
    t.string  "constant",            limit: 45,                null: false
    t.integer "width",               limit: 4,                 null: false
    t.integer "height",              limit: 4,                 null: false
    t.integer "quality",             limit: 4,  default: 0,    null: false
    t.string  "resize",              limit: 1,                 null: false
    t.string  "autorotate",          limit: 1,                 null: false
    t.integer "watermark_id",        limit: 4,                 null: false
    t.string  "description",         limit: 60,                null: false
    t.string  "is_zip_archive",      limit: 3,  default: "no", null: false
  end

  add_index "image_encoding", ["constant"], name: "constant", using: :btree
  add_index "image_encoding", ["upload_extension_id"], name: "fk_image_encoding_upload_extension", using: :btree

  create_table "image_file", primary_key: "image_file_id", force: :cascade do |t|
    t.integer  "image_id",          limit: 4,                  null: false
    t.integer  "image_encoding_id", limit: 4,                  null: false
    t.integer  "media_id",          limit: 4,                  null: false
    t.datetime "created",                                      null: false
    t.string   "filename",          limit: 50,                 null: false
    t.string   "sef_name",          limit: 250
    t.integer  "filesize",          limit: 4,                  null: false
    t.integer  "width",             limit: 4,                  null: false
    t.integer  "height",            limit: 4,                  null: false
    t.datetime "encode_start",                                 null: false
    t.datetime "encode_finish",                                null: false
    t.string   "encode_status",     limit: 10,                 null: false
    t.integer  "image_order",       limit: 4,                  null: false
    t.string   "shared_access",     limit: 3,   default: "no", null: false
  end

  add_index "image_file", ["image_id", "image_encoding_id", "filename"], name: "idx_for_cache_model_related_scenes", using: :btree
  add_index "image_file", ["image_id", "image_encoding_id", "media_id", "image_order", "image_file_id"], name: "fk_image_file_image", using: :btree
  add_index "image_file", ["media_id", "image_encoding_id", "image_order", "image_file_id"], name: "fk_image_file_media", using: :btree

  create_table "label", primary_key: "label_id", force: :cascade do |t|
    t.integer "company_id",            limit: 4,                       null: false
    t.string  "code",                  limit: 20,                      null: false
    t.string  "name",                  limit: 45,                      null: false
    t.string  "description",           limit: 60,                      null: false
    t.integer "days_for_free_release", limit: 4
    t.integer "external_data",         limit: 4,                       null: false
    t.integer "sort",                  limit: 4,   default: 0,         null: false
    t.string  "provide_scenes",        limit: 3,   default: "no",      null: false
    t.string  "forum_thread_url",      limit: 256
    t.string  "status",                limit: 8,   default: "enabled", null: false
  end

  add_index "label", ["company_id"], name: "fk_label_company", using: :btree

  create_table "line", primary_key: "line_id", force: :cascade do |t|
    t.integer "label_id",             limit: 4,                        null: false
    t.integer "company_id",           limit: 4,                        null: false
    t.integer "content_id",           limit: 4,                        null: false
    t.string  "code",                 limit: 20,                       null: false
    t.string  "name",                 limit: 128,                      null: false
    t.string  "description",          limit: 100,                      null: false
    t.integer "external_data",        limit: 4,                        null: false
    t.string  "direction",            limit: 8,   default: "straight", null: false
    t.boolean "should_be_verimarked", limit: 1,   default: false,      null: false
  end

  add_index "line", ["company_id"], name: "fk_line_company", using: :btree
  add_index "line", ["content_id"], name: "fk_line_content", unique: true, using: :btree
  add_index "line", ["label_id"], name: "fk_line_label", using: :btree

  create_table "media", primary_key: "media_id", force: :cascade do |t|
    t.integer "media_type_id",          limit: 4,               null: false
    t.integer "source_media_id",        limit: 4
    t.string  "lighttp_options",        limit: 45
    t.integer "comments",               limit: 4,               null: false
    t.integer "ratings",                limit: 4,               null: false
    t.integer "average_rating",         limit: 4,               null: false
    t.integer "views",                  limit: 4,               null: false
    t.integer "downloads",              limit: 4,               null: false
    t.string  "hot",                    limit: 1,               null: false
    t.integer "peers",                  limit: 4,               null: false
    t.integer "seeds",                  limit: 4,               null: false
    t.integer "gallery_group",          limit: 1,   default: 0, null: false
    t.integer "gallery_rate",           limit: 1,   default: 0, null: false
    t.integer "dead",                   limit: 1,   default: 0, null: false
    t.string  "title",                  limit: 127
    t.string  "description",            limit: 255
    t.integer "thumbnail_clicks_count", limit: 4,   default: 0, null: false
    t.integer "timecode",               limit: 4
    t.string  "hardness",               limit: 4
  end

  add_index "media", ["media_type_id"], name: "fk_media_media_type", using: :btree
  add_index "media", ["source_media_id"], name: "source_media", using: :btree
  add_index "media", ["thumbnail_clicks_count", "ratings"], name: "sort_best", using: :btree
  add_index "media", ["timecode"], name: "timecode", using: :btree

  create_table "media_type", primary_key: "media_type_id", force: :cascade do |t|
    t.string "name",     limit: 45, null: false
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

  create_table "upload", primary_key: "upload_id", force: :cascade do |t|
    t.integer  "upload_action_id",                     limit: 4,                                null: false
    t.integer  "file_object_type_id",                  limit: 4,                                null: false
    t.datetime "created",                                                                       null: false
    t.integer  "company_id",                           limit: 4,                                null: false
    t.integer  "user_id",                              limit: 4,                                null: false
    t.integer  "content_id",                           limit: 4
    t.integer  "secondary_content_id",                 limit: 4
    t.integer  "target_id",                            limit: 4
    t.string   "upload_subpath",                       limit: 20000,                            null: false
    t.datetime "upload_start"
    t.datetime "upload_finish"
    t.string   "status",                               limit: 50,    default: "Upload waiting"
    t.string   "upload_status",                        limit: 10,    default: "waiting",        null: false
    t.string   "encode_status",                        limit: 10,    default: "waiting",        null: false
    t.string   "processing_status",                    limit: 10,    default: "waiting",        null: false
    t.string   "options",                              limit: 100
    t.string   "json_options",                         limit: 255
    t.string   "encoder_message",                      limit: 200
    t.integer  "priority",                             limit: 4,     default: 0,                null: false
    t.integer  "warnings",                             limit: 4,     default: 0,                null: false
    t.string   "upload_mode",                          limit: 3,     default: "ftp",            null: false
    t.string   "rebuild_status_of_affected_resources", limit: 10,    default: "skipped"
  end

  add_index "upload", ["company_id"], name: "fk_upload_company", using: :btree
  add_index "upload", ["content_id"], name: "fk_upload_content", using: :btree
  add_index "upload", ["encode_status"], name: "encode_status", using: :btree
  add_index "upload", ["file_object_type_id"], name: "fk_upload_file_object_type", using: :btree
  add_index "upload", ["processing_status"], name: "processing_status", using: :btree
  add_index "upload", ["secondary_content_id"], name: "secondary_content", using: :btree
  add_index "upload", ["upload_action_id"], name: "fk_upload_upload_action", using: :btree
  add_index "upload", ["upload_status", "encode_status", "rebuild_status_of_affected_resources"], name: "upload_status_2", using: :btree
  add_index "upload", ["upload_status"], name: "upload_status", using: :btree
  add_index "upload", ["user_id"], name: "fk_upload_user", using: :btree

  create_table "upload_action", primary_key: "upload_action_id", force: :cascade do |t|
    t.string  "name",                     limit: 30,  null: false
    t.string  "constant",                 limit: 45,  null: false
    t.integer "media_type",               limit: 4,   null: false
    t.string  "display",                  limit: 1,   null: false
    t.string  "display_main",             limit: 1,   null: false
    t.string  "button_text",              limit: 20,  null: false
    t.string  "action_message",           limit: 100, null: false
    t.string  "action_duplicate_message", limit: 100, null: false
  end

  create_table "upload_extension", primary_key: "upload_extension_id", force: :cascade do |t|
    t.string "name",        limit: 10, null: false
    t.string "description", limit: 45, null: false
  end

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

  create_table "video_encoding", primary_key: "video_encoding_id", force: :cascade do |t|
    t.string  "constant",              limit: 45,                null: false
    t.string  "name",                  limit: 30,                null: false
    t.string  "shortname",             limit: 20,                null: false
    t.integer "watermark_id",          limit: 4,                 null: false
    t.string  "description",           limit: 30,                null: false
    t.string  "small_logo_path",       limit: 45,                null: false
    t.string  "resolution",            limit: 5
    t.string  "codec",                 limit: 9
    t.integer "minimal_source_height", limit: 4,  default: 640,  null: false
    t.string  "available_for_keeper",  limit: 3,  default: "no", null: false
    t.string  "watermark",             limit: 9,  default: "no", null: false
    t.string  "target_device",         limit: 10
  end

  add_index "video_encoding", ["constant", "video_encoding_id"], name: "idx_constant", using: :btree

  create_table "video_file", primary_key: "video_file_id", force: :cascade do |t|
    t.integer  "video_id",                  limit: 4,                     null: false
    t.integer  "media_id",                  limit: 4,                     null: false
    t.integer  "video_encoding_id",         limit: 4,                     null: false
    t.integer  "source_video_file_id",      limit: 4
    t.datetime "created",                                                 null: false
    t.string   "filename",                  limit: 25,                    null: false
    t.integer  "filesize",                  limit: 4,                     null: false
    t.float    "duration",                  limit: 24,                    null: false
    t.integer  "width",                     limit: 4,                     null: false
    t.integer  "height",                    limit: 4,                     null: false
    t.integer  "frame_count",               limit: 4,                     null: false
    t.float    "frame_rate",                limit: 24,                    null: false
    t.integer  "bitrate",                   limit: 4,                     null: false
    t.datetime "encode_start",                                            null: false
    t.datetime "encode_finish",                                           null: false
    t.string   "encode_status",             limit: 10,                    null: false
    t.string   "prepared_for_wm_embedding", limit: 3,  default: "no"
    t.integer  "video_order",               limit: 4,                     null: false
    t.string   "ratio",                     limit: 4,  default: "4:3"
    t.string   "status",                    limit: 7,  default: "exists", null: false
    t.string   "is_expirable",              limit: 3,  default: "no",     null: false
  end

  add_index "video_file", ["media_id"], name: "fk_video_file_media", using: :btree
  add_index "video_file", ["source_video_file_id"], name: "fk_video_file_video_file1", using: :btree
  add_index "video_file", ["video_id"], name: "fk_video_file_video", using: :btree

end
