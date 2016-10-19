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

  create_table "Calendar", primary_key: "date", force: :cascade do |t|
  end

  create_table "access_list", primary_key: "access_list_id", force: :cascade do |t|
    t.integer  "ip_group_id", limit: 4,                            null: false
    t.string   "ip",          limit: 15,                           null: false
    t.string   "ip_network",  limit: 15,                           null: false
    t.string   "permission",  limit: 5,     default: "allow",      null: false
    t.string   "is_active",   limit: 3,     default: "yes",        null: false
    t.datetime "created",                                          null: false
    t.datetime "expires"
    t.text     "comment",     limit: 65535
    t.string   "server",      limit: 11,    default: "production"
  end

  add_index "access_list", ["ip_group_id", "ip", "ip_network"], name: "ip_UNIQUE", unique: true, using: :btree
  add_index "access_list", ["ip_group_id"], name: "fk_access_list_ip_group1", using: :btree

  create_table "access_log", primary_key: "AccessId", force: :cascade do |t|
    t.datetime "start_time",                 null: false
    t.datetime "end_time",                   null: false
    t.integer  "total_time",     limit: 4,   null: false
    t.string   "userid",         limit: 45,  null: false
    t.string   "ip",             limit: 16,  null: false
    t.string   "url",            limit: 255, null: false
    t.integer  "bytes_streamed", limit: 4,   null: false
  end


  create_table "audio", primary_key: "audio_id", force: :cascade do |t|
    t.integer  "upload_id",            limit: 4,  null: false
    t.integer  "file_object_type_id",  limit: 4,  null: false
    t.integer  "company_id",           limit: 4,  null: false
    t.integer  "user_id",              limit: 4,  null: false
    t.integer  "content_id",           limit: 4
    t.integer  "secondary_content_id", limit: 4
    t.integer  "storage_id",           limit: 4,  null: false
    t.string   "subpath",              limit: 20, null: false
    t.string   "url",                  limit: 45, null: false
    t.integer  "audio_order",          limit: 4,  null: false
    t.datetime "created",                         null: false
  end

  add_index "audio", ["company_id"], name: "fk_audio_company", using: :btree
  add_index "audio", ["content_id"], name: "fk_audio_content", using: :btree
  add_index "audio", ["file_object_type_id"], name: "fk_audio_file_object_type", using: :btree
  add_index "audio", ["secondary_content_id"], name: "secondary_content", using: :btree
  add_index "audio", ["storage_id"], name: "fk_audio_storage", using: :btree
  add_index "audio", ["upload_id"], name: "fk_audio_upload", using: :btree
  add_index "audio", ["user_id"], name: "fk_audio_user", using: :btree

  create_table "audio_encoded", primary_key: "audio_encoded_id", force: :cascade do |t|
    t.integer  "audio_id",          limit: 4,    null: false
    t.integer  "audio_encoding_id", limit: 4,    null: false
    t.integer  "encoder_server_id", limit: 4,    null: false
    t.datetime "encode_start",                   null: false
    t.datetime "encode_finish",                  null: false
    t.string   "encode_status",     limit: 10,   null: false
    t.string   "encode_log",        limit: 1000, null: false
  end

  add_index "audio_encoded", ["audio_id"], name: "fk_audio_encoded_audio", using: :btree
  add_index "audio_encoded", ["encoder_server_id"], name: "fk_audio_encoded_encoder_server", using: :btree

  create_table "audio_encoder", primary_key: "audio_encoder_id", force: :cascade do |t|
    t.string "name",           limit: 20,  null: false
    t.string "file_extension", limit: 20,  null: false
    t.string "description",    limit: 100, null: false
  end

  create_table "audio_encoding", primary_key: "audio_encoding_id", force: :cascade do |t|
    t.integer "upload_extension_id", limit: 4,  null: false
    t.string  "constant",            limit: 45, null: false
    t.string  "name",                limit: 30, null: false
    t.string  "shortname",           limit: 20, null: false
    t.integer "watermark_id",        limit: 4,  null: false
    t.string  "description",         limit: 30, null: false
    t.string  "small_logo_path",     limit: 45, null: false
    t.string  "resolution",          limit: 3
    t.string  "codec",               limit: 9
  end

  add_index "audio_encoding", ["upload_extension_id"], name: "fk_audio_encoding_upload_extension", using: :btree

  create_table "audio_file", primary_key: "audio_file_id", force: :cascade do |t|
    t.integer  "audio_id",          limit: 4,  null: false
    t.integer  "media_id",          limit: 4,  null: false
    t.integer  "parent_media_id",   limit: 4,  null: false
    t.integer  "audio_encoding_id", limit: 4,  null: false
    t.datetime "created",                      null: false
    t.string   "filename",          limit: 25, null: false
    t.integer  "filesize",          limit: 4,  null: false
    t.float    "duration",          limit: 24, null: false
    t.integer  "width",             limit: 4,  null: false
    t.integer  "height",            limit: 4,  null: false
    t.integer  "frame_count",       limit: 4,  null: false
    t.float    "frame_rate",        limit: 24, null: false
    t.integer  "bitrate",           limit: 4,  null: false
    t.datetime "encode_start",                 null: false
    t.datetime "encode_finish",                null: false
    t.string   "encode_status",     limit: 10, null: false
    t.integer  "audio_order",       limit: 4,  null: false
  end

  add_index "audio_file", ["audio_id"], name: "fk_audio_file_audio", using: :btree
  add_index "audio_file", ["media_id"], name: "fk_audio_file_media", using: :btree
  add_index "audio_file", ["parent_media_id"], name: "parent_media_id", using: :btree

  create_table "audio_processing", primary_key: "audio_processing_id", force: :cascade do |t|
    t.integer "file_object_type_id", limit: 4, null: false
    t.integer "audio_encoder_id",    limit: 4, null: false
  end

  create_table "auth_certificate", primary_key: "auth_certificate_id", force: :cascade do |t|
    t.string   "hash",                 limit: 128,                        null: false
    t.integer  "link_website_user_id", limit: 4,                          null: false
    t.datetime "created",                                                 null: false
    t.string   "mode",                 limit: 10,  default: "single-use", null: false
    t.string   "is_usable",            limit: 3,   default: "yes",        null: false
    t.datetime "expires"
  end

  add_index "auth_certificate", ["hash"], name: "hash_unique", unique: true, using: :btree
  add_index "auth_certificate", ["link_website_user_id"], name: "fk_auth_certificate_link_website_user1", using: :btree

  create_table "barcode", primary_key: "barcode_id", force: :cascade do |t|
    t.integer "company_id",   limit: 4,  null: false
    t.string  "prefix",       limit: 20, null: false
    t.string  "random_count", limit: 1,  null: false
  end

  add_index "barcode", ["company_id"], name: "fk_barcode_company", using: :btree

  create_table "blocked_tag", primary_key: "blocked_tag_id", force: :cascade do |t|
    t.string "tagtext", limit: 100, null: false
  end

  add_index "blocked_tag", ["tagtext"], name: "tagtext", unique: true, using: :btree

  create_table "blocked_tag_brick", primary_key: "blocked_tag_brick_id", force: :cascade do |t|
    t.string "word", limit: 32, null: false
  end

  add_index "blocked_tag_brick", ["word"], name: "word", unique: true, using: :btree

  create_table "cache_content_models_n_genres", primary_key: "content_id", force: :cascade do |t|
    t.string "genres", limit: 1024
    t.string "models", limit: 1024
  end

  create_table "cache_frontpage_slideshow", id: false, force: :cascade do |t|
    t.integer "content_id",     limit: 4
    t.integer "downloads",      limit: 4
    t.integer "average_rating", limit: 4
    t.float   "price_rate",     limit: 24
    t.integer "website_id",     limit: 4
    t.integer "genre_id",       limit: 4
  end

  add_index "cache_frontpage_slideshow", ["genre_id"], name: "genre_idx", using: :btree
  add_index "cache_frontpage_slideshow", ["website_id"], name: "website_idx", using: :btree

  create_table "cache_log", primary_key: "cache_log_id", force: :cascade do |t|
    t.datetime "timestamp",                                 null: false
    t.string   "status",         limit: 5,   default: "ok", null: false
    t.string   "message",        limit: 255
    t.time     "execution_time"
  end

  create_table "cache_model_related_scenes", id: false, force: :cascade do |t|
    t.integer  "model_content_id",          limit: 4
    t.integer  "video_id",                  limit: 4,    default: 0,         null: false
    t.integer  "scene_id",                  limit: 4,    default: 0,         null: false
    t.string   "scene_name",                limit: 128,  default: "",        null: false
    t.integer  "file_object_type_id",       limit: 4,                        null: false
    t.integer  "content_id",                limit: 4,                        null: false
    t.integer  "media_id",                  limit: 4,                        null: false
    t.integer  "video_encoding_id",         limit: 4,                        null: false
    t.datetime "release_date",                                               null: false
    t.integer  "website_id",                limit: 4,                        null: false
    t.string   "main_thumbnail_image",      limit: 255
    t.string   "models",                    limit: 1024
    t.integer  "average_rating",            limit: 8,    default: 0,         null: false
    t.string   "thumbnails_set",            limit: 255
    t.string   "sef_name",                  limit: 100,  default: "content"
    t.string   "subpath",                   limit: 20,                       null: false
    t.integer  "image_file_object_type_id", limit: 4,                        null: false
    t.string   "filename",                  limit: 50,                       null: false
    t.integer  "image_encoding_id",         limit: 4,                        null: false
    t.string   "storage_url",               limit: 45,                       null: false
  end

  add_index "cache_model_related_scenes", ["model_content_id", "website_id"], name: "model_content_id", using: :btree

  create_table "cache_vw_content_director", id: false, force: :cascade do |t|
    t.integer "director_id",          limit: 4,   default: 0, null: false
    t.integer "company_id",           limit: 4,               null: false
    t.integer "content_id",           limit: 4,               null: false
    t.string  "name",                 limit: 30,              null: false
    t.string  "public",               limit: 1,               null: false
    t.integer "website_id",           limit: 4,               null: false
    t.string  "sef_name",             limit: 255
    t.integer "total_content",        limit: 8,   default: 0, null: false
    t.integer "total_scene_trailers", limit: 8
  end

  create_table "cache_vw_content_video_thumbnail", id: false, force: :cascade do |t|
    t.integer  "media_id",                  limit: 4,   default: 0, null: false
    t.integer  "hot",                       limit: 4
    t.integer  "seeding",                   limit: 4
    t.integer  "vote_sum",                  limit: 4
    t.integer  "vote_total",                limit: 4
    t.integer  "views",                     limit: 4
    t.integer  "downloads",                 limit: 4
    t.integer  "content_id",                limit: 4
    t.datetime "video_created"
    t.string   "file_object_type_constant", limit: 45
    t.integer  "content_family_id",         limit: 4
    t.string   "content_family_sef_name",   limit: 255
    t.string   "file_type_family_name",     limit: 30
    t.integer  "hd",                        limit: 4
    t.float    "duration",                  limit: 24
    t.float    "full_video_duration",       limit: 24
    t.integer  "filesize",                  limit: 4
    t.string   "image_path",                limit: 200
    t.string   "image_url",                 limit: 200
    t.string   "main_thumbnail_image",      limit: 255
    t.string   "playshot_image",            limit: 255
    t.string   "thumbnails_set",            limit: 255
    t.string   "timeline_image",            limit: 255
    t.string   "content_title",             limit: 275
    t.integer  "director_id",               limit: 8,   default: 0, null: false
    t.string   "director_sef_name",         limit: 255
    t.time     "runtime"
    t.string   "scene_genre_list",          limit: 341
    t.string   "scene_genre_sef_name_list", limit: 341
    t.string   "model_list",                limit: 341
    t.string   "model_sef_name_list",       limit: 341
    t.integer  "label_id",                  limit: 8
    t.string   "label_name",                limit: 45
    t.string   "content_type",              limit: 20
    t.string   "content_sef_name",          limit: 255
    t.integer  "line_id",                   limit: 8
    t.integer  "scene_id",                  limit: 4,   default: 0, null: false
    t.string   "scene_name",                limit: 128,             null: false
    t.integer  "studio_id",                 limit: 4
    t.string   "studio_name",               limit: 20
  end

  add_index "cache_vw_content_video_thumbnail", ["content_id"], name: "content_video_thumbnail_cid", using: :btree
  add_index "cache_vw_content_video_thumbnail", ["media_id", "content_id", "thumbnails_set"], name: "idx_for_cache_model_related_scenes", using: :btree
  add_index "cache_vw_content_video_thumbnail", ["media_id"], name: "content_video_thumbnail_media_id", using: :btree

  create_table "cache_vw_genre_movies", id: false, force: :cascade do |t|
    t.integer "scene_genre_id",       limit: 4,   default: 0,         null: false
    t.integer "company_id",           limit: 4,                       null: false
    t.string  "name",                 limit: 45,                      null: false
    t.string  "public",               limit: 1
    t.integer "external_data",        limit: 4,                       null: false
    t.integer "content_id",           limit: 4
    t.integer "sweetness",            limit: 1,   default: 1,         null: false
    t.string  "sef_name",             limit: 100, default: "content"
    t.integer "website_id",           limit: 4,                       null: false
    t.integer "total_movies",         limit: 8,   default: 0,         null: false
    t.integer "total_scene_trailers", limit: 8
  end

  create_table "cache_vw_media_video_thumbnail", primary_key: "media_id", force: :cascade do |t|
    t.integer  "hot",                       limit: 4
    t.integer  "seeding",                   limit: 4
    t.integer  "vote_sum",                  limit: 4
    t.integer  "vote_total",                limit: 4
    t.integer  "views",                     limit: 4
    t.integer  "downloads",                 limit: 4
    t.integer  "content_id",                limit: 4
    t.datetime "video_created"
    t.string   "file_object_type_constant", limit: 45
    t.integer  "content_family_id",         limit: 4
    t.string   "content_family_sef_name",   limit: 255
    t.string   "file_type_family_name",     limit: 30
    t.integer  "hd",                        limit: 4,     default: 0
    t.integer  "filesize",                  limit: 4
    t.float    "duration",                  limit: 24
    t.float    "full_video_duration",       limit: 24
    t.string   "image_path",                limit: 200
    t.string   "image_url",                 limit: 200
    t.time     "runtime"
    t.string   "content_type",              limit: 20
    t.string   "content_sef_name",          limit: 255
    t.string   "main_thumbnail_image",      limit: 255
    t.string   "playshot_image",            limit: 255
    t.string   "thumbnails_set",            limit: 255
    t.string   "timeline_image",            limit: 255
    t.text     "timeline_json",             limit: 65535
  end

  add_index "cache_vw_media_video_thumbnail", ["content_id"], name: "content_id", using: :btree

  create_table "cache_vw_model_scene", id: false, force: :cascade do |t|
    t.datetime "create_time",                                        null: false
    t.integer  "scene_content_id",         limit: 4,                 null: false
    t.integer  "scene_id",                 limit: 4,     default: 0, null: false
    t.integer  "model_id",                 limit: 4,                 null: false
    t.integer  "scene_number",             limit: 4,                 null: false
    t.text     "scene_genres",             limit: 65535
    t.integer  "scene_count_video",        limit: 8
    t.integer  "scene_count_model",        limit: 8
    t.integer  "scene_count_gallery",      limit: 8
    t.float    "scene_duration",           limit: 53
    t.integer  "movie_id",                 limit: 4,     default: 0, null: false
    t.string   "movie_name",               limit: 128,               null: false
    t.time     "movie_runtime",                                      null: false
    t.datetime "movie_first_release_date"
    t.string   "movie_first_release_url",  limit: 70
  end

  create_table "cache_vw_scene_filter", id: false, force: :cascade do |t|
    t.integer "scene_id",           limit: 4,    default: 0,     null: false
    t.integer "content_id",         limit: 4,                    null: false
    t.integer "website_id",         limit: 4,                    null: false
    t.integer "age",                limit: 4
    t.integer "views",              limit: 4,                    null: false
    t.integer "rate",               limit: 8,    default: 0,     null: false
    t.integer "downloads",          limit: 4,                    null: false
    t.float   "price",              limit: 24,   default: 0.0,   null: false
    t.string  "scene_name",         limit: 128,  default: "",    null: false
    t.string  "description",        limit: 200,  default: "",    null: false
    t.string  "thumbnail_url",      limit: 255
    t.integer "vote_total",         limit: 8,    default: 0,     null: false
    t.string  "models",             limit: 1024
    t.string  "ratio",              limit: 4,    default: "4:3"
    t.string  "special_scene_name", limit: 31,   default: "",    null: false
  end

  add_index "cache_vw_scene_filter", ["website_id", "age", "scene_id"], name: "idx_newest", using: :btree
  add_index "cache_vw_scene_filter", ["website_id", "downloads", "scene_id"], name: "idx_most_downloaded", using: :btree
  add_index "cache_vw_scene_filter", ["website_id", "price", "scene_id"], name: "idx_cheapest_expensive", using: :btree
  add_index "cache_vw_scene_filter", ["website_id", "rate", "scene_id"], name: "idx_most_rated", using: :btree
  add_index "cache_vw_scene_filter", ["website_id", "views", "scene_id"], name: "idx_most_viewed", using: :btree

  create_table "cache_vw_scene_image", id: false, force: :cascade do |t|
    t.integer  "image_id",               limit: 4,    default: 0,  null: false
    t.integer  "file_object_type_id",    limit: 4,                 null: false
    t.integer  "content_id",             limit: 4,                 null: false
    t.integer  "storage_id",             limit: 4,                 null: false
    t.string   "subpath",                limit: 20,                null: false
    t.string   "url",                    limit: 45,                null: false
    t.string   "image_storage_url",      limit: 45,                null: false
    t.integer  "scene_id",               limit: 4,    default: 0,  null: false
    t.string   "small_description",      limit: 200,  default: "", null: false
    t.string   "big_description",        limit: 400,  default: "", null: false
    t.string   "scene_name",             limit: 128,  default: "", null: false
    t.datetime "release_date",                                     null: false
    t.integer  "views",                  limit: 4,                 null: false
    t.integer  "downloads",              limit: 4,                 null: false
    t.integer  "website_id",             limit: 4,                 null: false
    t.integer  "scene_number",           limit: 4
    t.string   "movie_name",             limit: 128
    t.integer  "movie_id",               limit: 4,    default: 0
    t.string   "genres",                 limit: 1024
    t.string   "models",                 limit: 1024
    t.string   "file_object_type_const", limit: 45,                null: false
  end

  add_index "cache_vw_scene_image", ["content_id"], name: "fk_cache_vw_scene_image_content1", using: :btree
  add_index "cache_vw_scene_image", ["website_id"], name: "fk_cache_vw_scene_image_website1", using: :btree

  create_table "cache_vw_scene_video", id: false, force: :cascade do |t|
    t.integer  "video_id",                       limit: 4,    default: 0,   null: false
    t.integer  "file_object_type_id",            limit: 4,                  null: false
    t.integer  "content_id",                     limit: 4,                  null: false
    t.integer  "storage_id",                     limit: 4,                  null: false
    t.string   "subpath",                        limit: 20,                 null: false
    t.string   "url",                            limit: 45,                 null: false
    t.string   "video_storage_url",              limit: 45,                 null: false
    t.integer  "media_id",                       limit: 4,                  null: false
    t.integer  "video_encoding_id",              limit: 4,                  null: false
    t.datetime "created",                                                   null: false
    t.string   "filename",                       limit: 25,                 null: false
    t.float    "duration",                       limit: 24,                 null: false
    t.integer  "filesize",                       limit: 4,                  null: false
    t.integer  "scene_id",                       limit: 4,    default: 0,   null: false
    t.string   "small_description",              limit: 200,  default: "",  null: false
    t.string   "big_description",                limit: 400,  default: "",  null: false
    t.time     "runtime"
    t.string   "scene_name",                     limit: 128,  default: "",  null: false
    t.datetime "release_date",                                              null: false
    t.integer  "views",                          limit: 4,                  null: false
    t.integer  "downloads",                      limit: 4,                  null: false
    t.integer  "website_id",                     limit: 4,                  null: false
    t.string   "main_thumbnail_image",           limit: 255
    t.integer  "scene_number",                   limit: 4
    t.string   "movie_name",                     limit: 128
    t.integer  "movie_id",                       limit: 4,    default: 0
    t.string   "genres",                         limit: 1024
    t.string   "models",                         limit: 1024
    t.string   "file_object_type_const",         limit: 45,                 null: false
    t.string   "category",                       limit: 11
    t.integer  "content_release_average_rating", limit: 8,    default: 0,   null: false
    t.float    "price_rate",                     limit: 24,   default: 0.0, null: false
    t.integer  "vote_total",                     limit: 8,    default: 0,   null: false
  end

  add_index "cache_vw_scene_video", ["content_id", "media_id", "website_id"], name: "idx_for_cache_model_related_scenes", using: :btree
  add_index "cache_vw_scene_video", ["content_id"], name: "fk_cache_vw_scene_video_content1", using: :btree
  add_index "cache_vw_scene_video", ["website_id"], name: "fk_cache_vw_scene_video_website1", using: :btree

  create_table "cc_holder_index", primary_key: "cc_holder_index_id", force: :cascade do |t|
    t.integer "website_user_id",      limit: 4,  null: false
    t.string  "holder",               limit: 40, null: false
    t.integer "creditcard_detail_id", limit: 4,  null: false
  end

  add_index "cc_holder_index", ["holder"], name: "full_holder", type: :fulltext
  add_index "cc_holder_index", ["website_user_id"], name: "fk_website_user_id", using: :btree

  create_table "cluster", force: :cascade do |t|
    t.string "host_name", limit: 254,                 null: false
    t.string "host_type", limit: 32,                  null: false
    t.string "is_usable", limit: 3,   default: "yes", null: false
  end

  create_table "comment", primary_key: "comment_id", force: :cascade do |t|
    t.integer  "website_user_id",        limit: 4
    t.string   "username",               limit: 45
    t.string   "email",                  limit: 45
    t.integer  "parent_comment_id",      limit: 4,                   null: false
    t.integer  "root_parent_comment_id", limit: 4,    default: 0
    t.integer  "popula_id",              limit: 4,                   null: false
    t.integer  "popula_type",            limit: 4,                   null: false
    t.datetime "created",                                            null: false
    t.integer  "votes",                  limit: 4,                   null: false
    t.string   "comment",                limit: 1000,                null: false
    t.string   "approved",               limit: 3,    default: "no", null: false
  end

  add_index "comment", ["website_user_id"], name: "fk_comment_website_user", using: :btree

  create_table "comment_abuse", primary_key: "comment_abuse_id", force: :cascade do |t|
    t.integer  "website_session_id", limit: 4,   null: false
    t.datetime "created",                        null: false
    t.string   "referer_url",        limit: 200
    t.integer  "comment_id",         limit: 4,   null: false
  end

  add_index "comment_abuse", ["comment_id"], name: "comment_id", using: :btree
  add_index "comment_abuse", ["website_session_id"], name: "fk_website_session_id", using: :btree

  create_table "comment_deleted", primary_key: "comment_deleted_id", force: :cascade do |t|
    t.integer  "website_session_id", limit: 4,     null: false
    t.datetime "created",                          null: false
    t.string   "referer_url",        limit: 200
    t.text     "comment",            limit: 65535, null: false
  end

  add_index "comment_deleted", ["website_session_id"], name: "fk_website_session_id", using: :btree

  create_table "comment_vote", primary_key: "comment_vote_id", force: :cascade do |t|
    t.integer  "comment_id",      limit: 4, null: false
    t.integer  "website_user_id", limit: 4, null: false
    t.datetime "created",                   null: false
    t.integer  "vote",            limit: 4, null: false
  end

  add_index "comment_vote", ["comment_id"], name: "fk_comment_vote_comment", using: :btree
  add_index "comment_vote", ["website_user_id"], name: "fk_comment_vote_website_user", using: :btree

  create_table "content_has_image", id: false, force: :cascade do |t|
    t.integer "content_id", limit: 4, null: false
    t.integer "image_id",   limit: 4, null: false
  end

  add_index "content_has_image", ["content_id"], name: "fk_content_has_image_content1", using: :btree
  add_index "content_has_image", ["image_id"], name: "fk_content_has_image_image1", using: :btree

  create_table "content_has_keyword", id: false, force: :cascade do |t|
    t.integer "content_id", limit: 4,             null: false
    t.integer "keyword_id", limit: 4,             null: false
    t.integer "weight",     limit: 1, default: 0, null: false
  end

  add_index "content_has_keyword", ["content_id"], name: "fk_content_has_keyword_content1", using: :btree
  add_index "content_has_keyword", ["keyword_id"], name: "fk_content_has_keyword_keyword1", using: :btree

  create_table "content_has_page", id: false, force: :cascade do |t|
    t.integer "content_id", limit: 4, null: false
    t.integer "page_id",    limit: 4, null: false
  end

  add_index "content_has_page", ["content_id"], name: "fk_content_has_page_content1", using: :btree
  add_index "content_has_page", ["page_id"], name: "fk_content_has_page_page1", using: :btree

  create_table "content_has_social_network_account", primary_key: "content_has_social_network_account_id", force: :cascade do |t|
    t.integer "content_id",                limit: 4, null: false
    t.integer "social_network_account_id", limit: 4, null: false
  end

  create_table "content_has_video", id: false, force: :cascade do |t|
    t.integer "content_id", limit: 4, null: false
    t.integer "video_id",   limit: 4, null: false
  end

  add_index "content_has_video", ["content_id"], name: "fk_content_has_video_content1", using: :btree
  add_index "content_has_video", ["video_id"], name: "fk_content_has_video_video1", using: :btree

  create_table "content_popularity_stat", primary_key: "content_popularity_stat_id", force: :cascade do |t|
    t.integer  "content_id",        limit: 4,              null: false
    t.integer  "scene_id",          limit: 4,              null: false
    t.integer  "website_user_id",   limit: 4,              null: false
    t.string   "is_only_lp_user",   limit: 3
    t.integer  "website_id",        limit: 4,              null: false
    t.integer  "resource_id",       limit: 4,              null: false
    t.integer  "is_ppd",            limit: 1,  default: 0, null: false
    t.integer  "is_streaming",      limit: 1,  default: 0, null: false
    t.integer  "is_exchange",       limit: 1,  default: 0, null: false
    t.integer  "is_unlim_exchange", limit: 1,  default: 0, null: false
    t.float    "value",             limit: 24,             null: false
    t.datetime "created"
  end

  add_index "content_popularity_stat", ["content_id"], name: "content_id", using: :btree
  add_index "content_popularity_stat", ["resource_id", "is_streaming"], name: "resource_id", unique: true, using: :btree
  add_index "content_popularity_stat", ["scene_id"], name: "scene_id", using: :btree


  create_table "content_price_rate_old", primary_key: "content_price_rate_id", force: :cascade do |t|
    t.integer "content_id",    limit: 4,                  null: false
    t.integer "website_id",    limit: 4
    t.string  "user_category", limit: 10, default: "all", null: false
    t.float   "rate",          limit: 24,                 null: false
    t.boolean "automatic",     limit: 1,                  null: false
  end

  add_index "content_price_rate_old", ["content_id", "website_id", "user_category"], name: "unique_price", unique: true, using: :btree
  add_index "content_price_rate_old", ["content_id"], name: "content_index", using: :btree

  create_table "content_relation", id: false, force: :cascade do |t|
    t.integer "master_content_id", limit: 4,                null: false
    t.integer "slave_content_id",  limit: 4,                null: false
    t.float   "by_genre",          limit: 24, default: 0.0
    t.float   "by_views",          limit: 24, default: 0.0
    t.float   "by_name",           limit: 24, default: 0.0
  end

  add_index "content_relation", ["master_content_id", "slave_content_id"], name: "master_content_id", unique: true, using: :btree
  add_index "content_relation", ["master_content_id"], name: "content_relation_ibfk_1", using: :btree
  add_index "content_relation", ["slave_content_id"], name: "slave_content_id", using: :btree



  create_table "content_release_rating", primary_key: "content_release_rating_id", force: :cascade do |t|
    t.integer  "content_release_id", limit: 4,  null: false
    t.integer  "website_user_id",    limit: 4,  null: false
    t.datetime "created",                       null: false
    t.float    "rating",             limit: 24, null: false
  end

  add_index "content_release_rating", ["content_release_id", "rating"], name: "idx_cache_model_related_scenes", using: :btree
  add_index "content_release_rating", ["content_release_id"], name: "fk_content_release_rating_content_release1", using: :btree
  add_index "content_release_rating", ["website_user_id"], name: "fk_media_rating_website_user", using: :btree

  create_table "content_restriction", primary_key: "content_restriction_id", force: :cascade do |t|
    t.integer "content_id",  limit: 4, default: 0
    t.integer "geo_zone_id", limit: 4, default: 0,     null: false
    t.string  "is_active",   limit: 3, default: "yes"
  end

  add_index "content_restriction", ["content_id"], name: "fk_content_content_id", using: :btree
  add_index "content_restriction", ["geo_zone_id", "content_id"], name: "unique_content_geo_zone", unique: true, using: :btree
  add_index "content_restriction", ["geo_zone_id"], name: "geo_zone_id", using: :btree

  create_table "content_sales_by_day", id: false, force: :cascade do |t|
    t.integer  "content_id",              limit: 4,  default: 0, null: false
    t.datetime "released"
    t.string   "sold",                    limit: 10
    t.integer  "day_in_release",          limit: 4
    t.integer  "sales",                   limit: 8,  default: 0, null: false
    t.integer  "less_then_100_sale_days", limit: 4,  default: 0, null: false
    t.integer  "has_100_sale_days",       limit: 4,  default: 0, null: false
    t.integer  "website_id",              limit: 4,  default: 0, null: false
  end

  create_table "content_sales_by_day_for_547", id: false, force: :cascade do |t|
    t.integer  "content_id",              limit: 4,  default: 0, null: false
    t.datetime "released"
    t.string   "sold",                    limit: 10
    t.integer  "day_in_release",          limit: 4
    t.integer  "sales",                   limit: 8,  default: 0, null: false
    t.integer  "less_then_547_sale_days", limit: 4,  default: 0, null: false
    t.integer  "has_547_sale_days",       limit: 4,  default: 0, null: false
    t.integer  "website_id",              limit: 4,  default: 0, null: false
  end

  create_table "content_subscription", primary_key: "content_subscription_id", force: :cascade do |t|
    t.integer  "content_id",      limit: 4,                   null: false
    t.integer  "website_user_id", limit: 4,                   null: false
    t.datetime "created",                                     null: false
    t.string   "is_enabled",      limit: 3,   default: "yes", null: false
    t.string   "type",            limit: 6
    t.string   "name",            limit: 100
  end

  add_index "content_subscription", ["content_id", "website_user_id"], name: "website_user_content", unique: true, using: :btree
  add_index "content_subscription", ["content_id"], name: "fk_content_subscription_content1", using: :btree
  add_index "content_subscription", ["website_user_id"], name: "fk_content_subscription_website_user1", using: :btree

  create_table "content_subscription_news", primary_key: "content_subscription_news_id", force: :cascade do |t|
    t.integer  "content_subscription_id", limit: 4,   null: false
    t.integer  "media_id",                limit: 4,   null: false
    t.datetime "created",                             null: false
    t.string   "media_title",             limit: 127
    t.string   "media_description",       limit: 255
    t.string   "scene_name",              limit: 128
    t.string   "movie_name",              limit: 128
    t.datetime "publish_date"
    t.time     "runtime"
    t.integer  "rating",                  limit: 4
    t.string   "thumbnail_url",           limit: 255
    t.datetime "last_download"
  end

  add_index "content_subscription_news", ["content_subscription_id"], name: "fk_content_subscription_news_content_subscription1", using: :btree
  add_index "content_subscription_news", ["media_id"], name: "fk_content_subscription_news_media1", using: :btree


  create_table "content_type_has_file_object_type", id: false, force: :cascade do |t|
    t.integer "content_type_id",     limit: 4, null: false
    t.integer "file_object_type_id", limit: 4, null: false
  end

  add_index "content_type_has_file_object_type", ["content_type_id"], name: "fk_content_type_has_file_object_type_content_type1", using: :btree
  add_index "content_type_has_file_object_type", ["file_object_type_id"], name: "fk_content_type_has_file_object_type_file_object_type1", using: :btree

  create_table "cue", primary_key: "cue_id", force: :cascade do |t|
    t.integer "parent_video_media_id", limit: 4, null: false
    t.integer "illustration_media_id", limit: 4
    t.integer "framecode",             limit: 4
    t.integer "time",                  limit: 4
  end

  add_index "cue", ["illustration_media_id"], name: "fk_cue_media2", using: :btree
  add_index "cue", ["parent_video_media_id"], name: "fk_cue_media1", using: :btree

  create_table "currency", primary_key: "currency_id", force: :cascade do |t|
    t.string   "sign",                       limit: 4,  null: false
    t.string   "unicode_sign",               limit: 4,  null: false
    t.string   "name",                       limit: 40, null: false
    t.string   "code",                       limit: 4,  null: false
    t.integer  "numeric_code",               limit: 4,  null: false
    t.float    "exchange_rate",              limit: 24, null: false
    t.string   "apply_exchange_rate",        limit: 3,  null: false
    t.string   "update_exchange_rate",       limit: 3,  null: false
    t.string   "primary",                    limit: 1,  null: false
    t.integer  "rounding",                   limit: 4,  null: false
    t.datetime "last_exchange_rate_dynamic"
  end

  add_index "currency", ["code"], name: "idx_code_unique", unique: true, using: :btree

  create_table "currency_rate_history", primary_key: "idcurrency_rate_history", force: :cascade do |t|
    t.integer "currency_id", limit: 4,  null: false
    t.date    "date",                   null: false
    t.float   "USDPrice",    limit: 24, null: false
  end

  create_table "custom_dvd", primary_key: "custom_dvd_id", force: :cascade do |t|
    t.integer "link_website_user_id", limit: 4,                       null: false
    t.string  "title",                limit: 100
    t.string  "description",          limit: 2000
    t.string  "status",               limit: 10,   default: "opened", null: false
    t.integer "encoded_percent",      limit: 4,    default: 0,        null: false
    t.string  "error_message",        limit: 2000,                    null: false
  end

  add_index "custom_dvd", ["link_website_user_id"], name: "fk_custom_dvd_link_website_user1", using: :btree

  create_table "custom_dvd_content", primary_key: "custom_dvd_content_id", force: :cascade do |t|
    t.integer "custom_dvd_id", limit: 4, null: false
    t.integer "content_id",    limit: 4, null: false
    t.integer "sort_index",    limit: 4, null: false
  end

  add_index "custom_dvd_content", ["content_id"], name: "fk_custom_dvd_content_content1", using: :btree
  add_index "custom_dvd_content", ["custom_dvd_id"], name: "fk_custom_dvd_content_custom_dvd1", using: :btree

  create_table "dvd", primary_key: "dvd_id", force: :cascade do |t|
    t.integer  "dvd_template_id",  limit: 4
    t.integer  "content_id",       limit: 4,                         null: false
    t.string   "name",             limit: 255,                       null: false
    t.string   "disc_title",       limit: 50
    t.string   "import_path",      limit: 255,                       null: false
    t.integer  "foldersize",       limit: 8,                         null: false
    t.integer  "coded_percent",    limit: 1,     default: 0,         null: false
    t.datetime "coded_started"
    t.datetime "coded_finished"
    t.integer  "coded_dvd_size",   limit: 8,                         null: false
    t.integer  "download_counter", limit: 4,     default: 0,         null: false
    t.string   "dvd_status",       limit: 10,    default: "waiting"
    t.string   "description",      limit: 255
    t.integer  "tbdev_torrent_id", limit: 4
    t.integer  "movie_id",         limit: 4
    t.string   "dvdgen_alias",     limit: 50
    t.string   "dvd_type",         limit: 8
    t.text     "authoring_params", limit: 65535
    t.string   "rtorrent_src_dir", limit: 255
    t.integer  "custom_dvd_id",    limit: 4
  end

  add_index "dvd", ["content_id"], name: "fk_dvd_content1", unique: true, using: :btree
  add_index "dvd", ["custom_dvd_id"], name: "fk_dvd_custom_dvd1", using: :btree
  add_index "dvd", ["dvd_template_id"], name: "fk_dvd_dvd_template1", using: :btree
  add_index "dvd", ["movie_id"], name: "fk_dvd_movie1", using: :btree

  create_table "dvd_client_log", primary_key: "dvd_client_log_id", force: :cascade do |t|
    t.integer  "website_user_id", limit: 4
    t.integer  "dvd_id",          limit: 4
    t.datetime "created",                                      null: false
    t.string   "session",         limit: 50
    t.integer  "action_index",    limit: 4,     default: 0,    null: false
    t.string   "module",          limit: 45
    t.string   "action",          limit: 45
    t.string   "status",          limit: 5,     default: "ok"
    t.text     "dump",            limit: 65535
    t.text     "logging_notes",   limit: 65535
  end

  add_index "dvd_client_log", ["dvd_id"], name: "fk_dvd_client_log_dvd1", using: :btree
  add_index "dvd_client_log", ["website_user_id"], name: "fk_dvd_client_log_website_user1", using: :btree

  create_table "dvd_handle_log", primary_key: "dvd_handle_log_id", force: :cascade do |t|
    t.datetime "created",                         null: false
    t.string   "status",         limit: 5,        null: false
    t.text     "message",        limit: 16777215
    t.string   "operation_type", limit: 16,       null: false
    t.integer  "subject_id",     limit: 4
  end

  create_table "dvd_part", primary_key: "dvd_part_id", force: :cascade do |t|
    t.integer  "dvd_id",                  limit: 4,                                     null: false
    t.integer  "part_num",                limit: 1
    t.integer  "target_part_num",         limit: 1
    t.string   "src_filename",            limit: 255,                                   null: false
    t.integer  "src_filesize",            limit: 8,                                     null: false
    t.datetime "src_created"
    t.string   "src_md5checksum",         limit: 100
    t.string   "coded_video_filename",    limit: 255
    t.integer  "coded_video_filesize",    limit: 8
    t.string   "coded_video_md5checksum", limit: 100
    t.string   "coded_audio_filename",    limit: 255
    t.integer  "coded_audio_filesize",    limit: 8
    t.string   "coded_audio_md5checksum", limit: 100
    t.integer  "coded_percent",           limit: 1,     default: 0,                     null: false
    t.datetime "coded_started"
    t.datetime "coded_finished"
    t.string   "part_status",             limit: 10,    default: "waiting"
    t.integer  "content_id",              limit: 4
    t.text     "authoring_params",        limit: 65535
    t.time     "src_duration",                          default: '2000-01-01 00:00:00', null: false
  end

  add_index "dvd_part", ["content_id"], name: "fk_dvd_part_content1", using: :btree
  add_index "dvd_part", ["dvd_id"], name: "dvd_id", using: :btree

  create_table "dvd_template", primary_key: "dvd_template_id", force: :cascade do |t|
    t.string "name",                 limit: 45
    t.string "standard_type",        limit: 4,     null: false
    t.string "aspect_type",          limit: 6,     null: false
    t.string "template_folder_name", limit: 145,   null: false
    t.text   "template_params",      limit: 65535
  end

  create_table "dvd_userkey", primary_key: "dvd_userkey_id", force: :cascade do |t|
    t.integer  "good_id",                 limit: 4,                               null: false
    t.integer  "generated_percent",       limit: 1,   default: 0,                 null: false
    t.integer  "watermark_id",            limit: 4,                               null: false
    t.string   "watermark",               limit: 16,                              null: false
    t.integer  "size",                    limit: 8,                               null: false
    t.datetime "generate_started"
    t.datetime "generate_finished"
    t.string   "status",                  limit: 10,  default: "waiting"
    t.string   "keygen_alias",            limit: 50
    t.string   "key_type",                limit: 15,  default: "difference_file"
    t.integer  "only_specified_part_num", limit: 1
    t.string   "ifo_filename",            limit: 45
    t.string   "ifo_md5checksum",         limit: 100
    t.integer  "ifo_filesize",            limit: 4
    t.datetime "last_download"
  end

  add_index "dvd_userkey", ["good_id"], name: "fk_dvd_userkey_link_website_user_resource1", using: :btree
  add_index "dvd_userkey", ["watermark_id"], name: "fk_dvd_userkey_watermark1", using: :btree

  create_table "dvd_userkey_part", primary_key: "dvd_userkey_part_id", force: :cascade do |t|
    t.integer  "dvd_userkey_id",        limit: 4,                       null: false
    t.integer  "part_num",              limit: 1,                       null: false
    t.string   "filename",              limit: 255
    t.string   "md5checksum",           limit: 100
    t.integer  "filesize",              limit: 8
    t.string   "ifo_filename",          limit: 45
    t.string   "ifo_md5checksum",       limit: 100
    t.integer  "ifo_filesize",          limit: 4
    t.datetime "generate_started"
    t.datetime "generate_finished"
    t.string   "part_status",           limit: 10,  default: "waiting"
    t.integer  "generated_percent",     limit: 1
    t.integer  "target_video_filesize", limit: 8
    t.string   "target_video_filename", limit: 45
  end

  add_index "dvd_userkey_part", ["dvd_userkey_id"], name: "fk_dvd_userkey_part_dvd_userkey1", using: :btree

  create_table "encode_audio", primary_key: "encode_audio_id", force: :cascade do |t|
    t.integer  "upload_id",           limit: 4,  null: false
    t.integer  "file_object_type_id", limit: 4,  null: false
    t.integer  "user_id",             limit: 4,  null: false
    t.integer  "parent",              limit: 4,  null: false
    t.integer  "parent_type",         limit: 4,  null: false
    t.string   "source_path",         limit: 20, null: false
    t.datetime "encode_start",                   null: false
    t.datetime "encode_finish",                  null: false
    t.integer  "encode_status",       limit: 4,  null: false
    t.integer  "encoder_server_id",   limit: 4,  null: false
    t.integer  "audio_encoder_id",    limit: 4,  null: false
    t.string   "file_extension",      limit: 10, null: false
    t.integer  "watermark_id",        limit: 4,  null: false
  end

  create_table "encode_job", primary_key: "encode_job_id", force: :cascade do |t|
    t.integer  "upload_id",         limit: 4,  null: false
    t.integer  "encoding_id",       limit: 4,  null: false
    t.integer  "encoder_task_id",   limit: 4,  null: false
    t.datetime "encode_start",                 null: false
    t.datetime "encode_finish",                null: false
    t.string   "encode_status",     limit: 10, null: false
    t.integer  "encoder_server_id", limit: 4,  null: false
    t.datetime "created",                      null: false
  end

  add_index "encode_job", ["encoder_server_id"], name: "fk_encode_job_encoder_server1", using: :btree
  add_index "encode_job", ["encoder_task_id"], name: "fk_encode_job_encoder_task", using: :btree
  add_index "encode_job", ["upload_id"], name: "fk_encode_job_upload", using: :btree

  create_table "encode_log", primary_key: "encode_log_id", force: :cascade do |t|
    t.integer  "upload_id",   limit: 4
    t.datetime "created",                      null: false
    t.text     "message",     limit: 16777215, null: false
    t.string   "status",      limit: 7,        null: false
    t.integer  "encoding_id", limit: 4
  end

  add_index "encode_log", ["upload_id"], name: "upload_id", using: :btree

  create_table "encode_mysql_log", primary_key: "encode_mysql_log_id", force: :cascade do |t|
    t.datetime "created",                        null: false
    t.string   "query",         limit: 500,      null: false
    t.string   "error_code",    limit: 20,       null: false
    t.string   "error_message", limit: 200,      null: false
    t.text     "backtrace",     limit: 16777215, null: false
  end

  create_table "encoder_task", primary_key: "encoder_task_id", force: :cascade do |t|
    t.string "constant", limit: 45, null: false
    t.string "name",     limit: 30, null: false
  end

  create_table "error_log", primary_key: "error_log_id", force: :cascade do |t|
    t.string   "level",     limit: 8,        default: "low", null: false
    t.string   "module",    limit: 100
    t.integer  "code",      limit: 4
    t.text     "error",     limit: 16777215
    t.text     "context",   limit: 65535
    t.text     "trace",     limit: 65535
    t.datetime "timestamp",                                  null: false
    t.string   "is_solved", limit: 7,        default: "no"
  end

  create_table "failed_login_attempt", primary_key: "failed_login_attempt_id", force: :cascade do |t|
    t.datetime "time",                                       null: false
    t.string   "ip",          limit: 15
    t.string   "username",    limit: 45
    t.string   "auth_module", limit: 8,  default: "website"
  end

  create_table "faq", primary_key: "faq_id", force: :cascade do |t|
    t.string "website_class", limit: 45
    t.string "name",          limit: 45,    null: false
    t.string "html_question", limit: 100,   null: false
    t.string "html_title",    limit: 100,   null: false
    t.text   "html_text",     limit: 65535, null: false
  end

  create_table "feed", primary_key: "feed_id", force: :cascade do |t|
    t.string   "constant",             limit: 45,                  null: false
    t.string   "name",                 limit: 45,                  null: false
    t.string   "description",          limit: 500
    t.integer  "series",               limit: 4,   default: 1,     null: false
    t.string   "is_active",            limit: 3,   default: "no",  null: false
    t.string   "send_trace_copy",      limit: 3,   default: "yes", null: false
    t.datetime "last_trace_copy_time"
    t.string   "auto_subscription",    limit: 3,   default: "no",  null: false
    t.string   "picture_url",          limit: 255
  end

  create_table "feed_message", primary_key: "feed_message_id", force: :cascade do |t|
    t.integer "feed_id",       limit: 4
    t.integer "series",        limit: 4
    t.string  "message_title", limit: 255
    t.text    "message_body",  limit: 16777215
  end

  add_index "feed_message", ["feed_id"], name: "feed_id", using: :btree

  create_table "feed_subscriber", primary_key: "feed_subscriber_id", force: :cascade do |t|
    t.string   "email",                limit: 45, null: false
    t.datetime "created",                         null: false
    t.integer  "link_website_user_id", limit: 4
  end

  add_index "feed_subscriber", ["email"], name: "email_UNIQUE", unique: true, using: :btree
  add_index "feed_subscriber", ["link_website_user_id"], name: "fk_legalvideo_subscriber_link_website_user1", using: :btree

  create_table "feeding_log", primary_key: "feeding_log_id", force: :cascade do |t|
    t.integer  "feed_id",      limit: 4,        null: false
    t.datetime "created",                       null: false
    t.string   "status",       limit: 7,        null: false
    t.text     "message",      limit: 16777215
    t.string   "subject_type", limit: 45
    t.integer  "subject_id",   limit: 4
  end

  add_index "feeding_log", ["feed_id"], name: "fk_feeding_log_feed1", using: :btree

  create_table "fresh", primary_key: "fresh_id", force: :cascade do |t|
    t.datetime "time",                             null: false
    t.integer  "fresh_cathegory_id", limit: 4
    t.integer  "fresh_icon_id",      limit: 4
    t.string   "title",              limit: 100
    t.string   "description",        limit: 400
    t.text     "html",               limit: 65535
    t.string   "url",                limit: 200
  end

  add_index "fresh", ["fresh_cathegory_id"], name: "fk_fresh_fresh_cathegory", using: :btree
  add_index "fresh", ["fresh_icon_id"], name: "fk_fresh_fresh_icon", using: :btree

  create_table "fresh_cathegory", primary_key: "fresh_cathegory_id", force: :cascade do |t|
    t.string "cathegory_name", limit: 45, null: false
  end

  create_table "fresh_icon", primary_key: "fresh_icon_id", force: :cascade do |t|
    t.string "file_name", limit: 45, null: false
    t.string "icon_name", limit: 45, null: false
  end

  create_table "fresh_link_media", primary_key: "fresh_link_media_id", force: :cascade do |t|
    t.integer "fresh_id", limit: 4, null: false
    t.integer "media_id", limit: 4, null: false
  end

  add_index "fresh_link_media", ["fresh_id"], name: "fk_fresh_link_media_fresh", using: :btree
  add_index "fresh_link_media", ["fresh_link_media_id"], name: "fk_fresh_link_media_media", using: :btree

  create_table "fresh_link_thread", primary_key: "fresh_link_thread_id", force: :cascade do |t|
    t.integer "fresh_id",  limit: 4, null: false
    t.integer "thread_id", limit: 4, null: false
    t.integer "post_id",   limit: 4, null: false
  end

  add_index "fresh_link_thread", ["fresh_id"], name: "fk_fresh_link_thread_fresh", using: :btree

  create_table "ftp_directory", primary_key: "ftp_directory_id", force: :cascade do |t|
    t.string "directory", limit: 100
  end

  create_table "ftp_group", primary_key: "gid", force: :cascade do |t|
    t.string "groupname",   limit: 20,  null: false
    t.string "members",     limit: 100, null: false
    t.string "description", limit: 30,  null: false
  end

  create_table "ftp_xfer_stat", id: false, force: :cascade do |t|
    t.string  "userid",       limit: 20,  null: false
    t.string  "file",         limit: 200, null: false
    t.integer "size",         limit: 8,   null: false
    t.string  "address_full", limit: 45,  null: false
    t.string  "address_ip",   limit: 20,  null: false
    t.string  "command",      limit: 200, null: false
    t.string  "timespent",    limit: 30,  null: false
    t.string  "time",         limit: 30,  null: false
    t.string  "cmd",          limit: 200, null: false
    t.string  "dunno",        limit: 100
  end

  create_table "gallery", primary_key: "gallery_id", force: :cascade do |t|
    t.integer  "user_id",           limit: 4,     null: false
    t.integer  "company_id",        limit: 4,     null: false
    t.integer  "content_id",        limit: 4,     null: false
    t.integer  "gallery_source_id", limit: 4
    t.string   "name",              limit: 45,    null: false
    t.string   "code",              limit: 45
    t.string   "gallery_type",      limit: 8,     null: false
    t.string   "url",               limit: 500,   null: false
    t.string   "url_unencoded",     limit: 500
    t.datetime "created",                         null: false
    t.datetime "updated"
    t.datetime "publish_date"
    t.text     "source_xml",        limit: 65535
    t.string   "tiny_description",  limit: 30
    t.string   "small_description", limit: 60,    null: false
    t.text     "big_description",   limit: 65535
  end

  add_index "gallery", ["company_id"], name: "fk_gallery_company1", using: :btree
  add_index "gallery", ["content_id"], name: "content_id", unique: true, using: :btree
  add_index "gallery", ["content_id"], name: "fk_gallery_content1", using: :btree
  add_index "gallery", ["gallery_source_id"], name: "fk_gallery_gallery_source1", using: :btree
  add_index "gallery", ["user_id"], name: "fk_gallery_user1", using: :btree

  create_table "gallery_has_scene_genre", id: false, force: :cascade do |t|
    t.integer "gallery_id",     limit: 4, null: false
    t.integer "scene_genre_id", limit: 4, null: false
  end

  add_index "gallery_has_scene_genre", ["gallery_id"], name: "fk_gallery_has_scene_genre_gallery1", using: :btree
  add_index "gallery_has_scene_genre", ["scene_genre_id"], name: "fk_gallery_has_scene_genre_scene_genre1", using: :btree

  create_table "gallery_import_log", primary_key: "gallery_import_log_id", force: :cascade do |t|
    t.datetime "created",                         null: false
    t.string   "status",         limit: 5,        null: false
    t.text     "message",        limit: 16777215
    t.string   "operation_type", limit: 10,       null: false
    t.integer  "subject_id",     limit: 4
    t.string   "subject_type",   limit: 14
  end

  create_table "gallery_property", primary_key: "gallery_property_id", force: :cascade do |t|
    t.integer "gallery_id", limit: 4,   null: false
    t.string  "type",       limit: 11,  null: false
    t.string  "value",      limit: 255, null: false
  end

  add_index "gallery_property", ["gallery_id"], name: "fk_gallery_property_gallery1", using: :btree
  add_index "gallery_property", ["type", "value"], name: "type_value_index", using: :btree

  create_table "gallery_source", primary_key: "gallery_source_id", force: :cascade do |t|
    t.integer  "gallery_source_format_id", limit: 4,                   null: false
    t.integer  "user_id",                  limit: 4,                   null: false
    t.integer  "company_id",               limit: 4,                   null: false
    t.string   "name",                     limit: 100
    t.string   "active",                   limit: 3,   default: "yes", null: false
    t.string   "url",                      limit: 500
    t.string   "gallery_type",             limit: 8,                   null: false
    t.datetime "created"
    t.string   "last_source_hash",         limit: 250
    t.datetime "last_update"
  end

  add_index "gallery_source", ["company_id"], name: "fk_gallery_source_company1", using: :btree
  add_index "gallery_source", ["gallery_source_format_id"], name: "fk_gallery_source_gallery_source_format1", using: :btree
  add_index "gallery_source", ["user_id"], name: "fk_gallery_source_user1", using: :btree

  create_table "gallery_source_format", primary_key: "gallery_source_format_id", force: :cascade do |t|
    t.string "name",     limit: 45, null: false
    t.string "constant", limit: 45, null: false
  end

  add_index "gallery_source_format", ["constant"], name: "unique_constant", unique: true, using: :btree





  create_table "import_type", primary_key: "import_type", force: :cascade do |t|
    t.string "name", limit: 20, null: false
  end

  create_table "ip_group", primary_key: "ip_group_id", force: :cascade do |t|
    t.string "name",      limit: 45,                    null: false
    t.string "is_active", limit: 3,     default: "yes", null: false
    t.text   "comment",   limit: 65535
  end

  add_index "ip_group", ["name"], name: "name_UNIQUE", unique: true, using: :btree

  create_table "keyword", primary_key: "keyword_id", force: :cascade do |t|
    t.string   "word",     limit: 100, null: false
    t.string   "is_genre", limit: 3,   null: false
    t.string   "is_model", limit: 3,   null: false
    t.datetime "created",              null: false
  end


  create_table "language", primary_key: "language_id", force: :cascade do |t|
    t.integer "iso_code",    limit: 4,  null: false
    t.string  "shortname",   limit: 50, null: false
    t.string  "name",        limit: 50, null: false
    t.string  "description", limit: 80, null: false
  end

  create_table "line_has_scene_genre", id: false, force: :cascade do |t|
    t.integer "line_id",        limit: 4, null: false
    t.integer "scene_genre_id", limit: 4, null: false
  end

  add_index "line_has_scene_genre", ["line_id"], name: "fk_line_has_scene_genre_line1", using: :btree
  add_index "line_has_scene_genre", ["scene_genre_id"], name: "fk_line_has_scene_genre_scene_genre1", using: :btree

  create_table "link_comment_content", primary_key: "link_comment_content_id", force: :cascade do |t|
    t.integer "comment_id", limit: 4, null: false
    t.integer "content_id", limit: 4, null: false
  end

  add_index "link_comment_content", ["comment_id"], name: "fk_link_comment_content_comment", using: :btree
  add_index "link_comment_content", ["content_id"], name: "fk_link_comment_content_content", using: :btree

  create_table "link_comment_media", primary_key: "link_comment_media_id", force: :cascade do |t|
    t.integer "comment_id", limit: 4, null: false
    t.integer "media_id",   limit: 4, null: false
  end

  add_index "link_comment_media", ["comment_id"], name: "fk_link_comment_media_comment", using: :btree
  add_index "link_comment_media", ["media_id"], name: "fk_link_comment_media_media", using: :btree

  create_table "link_content_forum", primary_key: "link_content_forum_id", force: :cascade do |t|
    t.integer "content_id", limit: 4, null: false
    t.integer "forumid",    limit: 4, null: false
  end

  add_index "link_content_forum", ["content_id"], name: "fk_link_content_forum_content", using: :btree

  create_table "link_content_niche", primary_key: "link_content_niche_id", force: :cascade do |t|
    t.integer "content_id", limit: 4, null: false
    t.integer "niche_id",   limit: 4, null: false
    t.integer "media_id",   limit: 4, null: false
  end

  add_index "link_content_niche", ["content_id"], name: "fk_link_scene_niche_content1_idx", using: :btree
  add_index "link_content_niche", ["media_id"], name: "fk_link_scene_niche_media1_idx", using: :btree
  add_index "link_content_niche", ["niche_id"], name: "fk_link_scene_niche_niche1_idx", using: :btree

  create_table "link_content_thread", primary_key: "link_content_thread_id", force: :cascade do |t|
    t.integer "content_id", limit: 4, null: false
    t.integer "thread_id",  limit: 4, null: false
  end

  add_index "link_content_thread", ["content_id"], name: "fk_link_content_thread_content", using: :btree

  create_table "link_country_currency", primary_key: "link_country_currency_id", force: :cascade do |t|
    t.integer "country_id",  limit: 4, null: false
    t.integer "currency_id", limit: 4, null: false
  end

  add_index "link_country_currency", ["country_id"], name: "fk_link_country_currency_country", using: :btree
  add_index "link_country_currency", ["currency_id"], name: "fk_link_country_currency_currency", using: :btree

  create_table "link_cue_scene_genre", id: false, force: :cascade do |t|
    t.integer "cue_id",         limit: 4, null: false
    t.integer "scene_genre_id", limit: 4, null: false
  end

  add_index "link_cue_scene_genre", ["cue_id"], name: "fk_link_cue_scene_genre_cue1", using: :btree
  add_index "link_cue_scene_genre", ["scene_genre_id"], name: "fk_link_cue_scene_genre_scene_genre1", using: :btree

  create_table "link_encoder_server_task", primary_key: "link_encoder_server_task_id", force: :cascade do |t|
    t.integer "encoder_server_id", limit: 4, null: false
    t.integer "encoder_task_id",   limit: 4, null: false
  end

  add_index "link_encoder_server_task", ["encoder_server_id"], name: "fk_link_encoder_server_task_encoder_server", using: :btree
  add_index "link_encoder_server_task", ["encoder_task_id"], name: "fk_link_encoder_server_task_encoder_task", using: :btree

  create_table "link_file_object_type_extension", primary_key: "link_file_object_type_extension_id", force: :cascade do |t|
    t.integer "file_object_type_id", limit: 4, null: false
    t.integer "upload_extension_id", limit: 4, null: false
  end

  add_index "link_file_object_type_extension", ["file_object_type_id"], name: "fk_link_file_object_type_extension_file_object_type", using: :btree
  add_index "link_file_object_type_extension", ["upload_extension_id"], name: "fk_link_file_object_type_extension_upload_extension", using: :btree

  create_table "link_image_encoding_file_object_type", primary_key: "link_image_encoding_file_object_type_id", force: :cascade do |t|
    t.integer "image_encoding_id",   limit: 4,                null: false
    t.integer "file_object_type_id", limit: 4,                null: false
    t.string  "share_files",         limit: 3, default: "no", null: false
  end

  add_index "link_image_encoding_file_object_type", ["file_object_type_id"], name: "fk_link_image_encoding_file_object_type_file_object_type", using: :btree
  add_index "link_image_encoding_file_object_type", ["image_encoding_id"], name: "fk_link_image_encoding_file_object_type_image_encoding", using: :btree

  create_table "link_model_ids", primary_key: "link_model_ids_id", force: :cascade do |t|
    t.integer "model_id",     limit: 4, null: false
    t.integer "model_ids_id", limit: 4, null: false
  end

  add_index "link_model_ids", ["model_id"], name: "fk_link_model_ids_model", using: :btree
  add_index "link_model_ids", ["model_ids_id"], name: "fk_link_model_ids_model_ids", using: :btree

  create_table "link_model_stage_name", primary_key: "link_model_stage_name_id", force: :cascade do |t|
    t.integer "model_id",            limit: 4, null: false
    t.integer "model_stage_name_id", limit: 4, null: false
  end

  add_index "link_model_stage_name", ["model_id"], name: "fk_link_model_stage_name_model", using: :btree
  add_index "link_model_stage_name", ["model_stage_name_id"], name: "fk_link_model_stage_name_model_stage_name", using: :btree

  create_table "link_permission_group", primary_key: "link_permission_group_id", force: :cascade do |t|
    t.integer "permission_id",       limit: 4,                    null: false
    t.integer "permission_group_id", limit: 4,                    null: false
    t.string  "level",               limit: 45,                   null: false
    t.string  "privileges",          limit: 500, default: "view"
  end

  add_index "link_permission_group", ["permission_group_id"], name: "fk_link_permission_group_permission_group1", using: :btree
  add_index "link_permission_group", ["permission_id", "permission_group_id"], name: "unique_permission_in_group", unique: true, using: :btree
  add_index "link_permission_group", ["permission_id"], name: "fk_link_permission_group_permission1", using: :btree

  create_table "link_product_content_release", primary_key: "link_product_content_release_id", force: :cascade do |t|
    t.integer "product_id",            limit: 4, null: false
    t.integer "content_release_id",    limit: 4, null: false
    t.integer "content_release_delay", limit: 4, null: false
  end

  add_index "link_product_content_release", ["content_release_id"], name: "fk_link_product_website_content_release_content_release", using: :btree
  add_index "link_product_content_release", ["product_id", "content_release_id"], name: "unique_product_release", unique: true, using: :btree
  add_index "link_product_content_release", ["product_id"], name: "fk_link_product_content_release_product", using: :btree

  create_table "link_scene_genre", primary_key: "link_scene_genre_id", force: :cascade do |t|
    t.integer "scene_id",       limit: 4, null: false
    t.integer "scene_genre_id", limit: 4, null: false
  end

  add_index "link_scene_genre", ["scene_genre_id"], name: "fk_link_scene_category_scene_category", using: :btree
  add_index "link_scene_genre", ["scene_id"], name: "fk_link_scene_category_scene", using: :btree

  create_table "link_scene_genre_forum", primary_key: "link_scene_genre_forum_id", force: :cascade do |t|
    t.integer "scene_genre_id", limit: 4, null: false
    t.integer "forumid",        limit: 4, null: false
  end

  add_index "link_scene_genre_forum", ["scene_genre_id"], name: "fk_link_scene_genre_forum_scene_genre", using: :btree

  create_table "link_scene_genre_thread", primary_key: "link_scene_genre_thread_id", force: :cascade do |t|
    t.integer "scene_genre_id", limit: 4, null: false
    t.integer "threadid",       limit: 4, null: false
  end

  add_index "link_scene_genre_thread", ["scene_genre_id"], name: "fk_link_scene_genre_thread_scene_genre", using: :btree

  create_table "link_scene_keywords", primary_key: "link_scene_keywords_id", force: :cascade do |t|
    t.integer "scene_id",          limit: 4, null: false
    t.integer "scene_keywords_id", limit: 4, null: false
  end

  add_index "link_scene_keywords", ["scene_id"], name: "fk_link_scene_keywords_scene", using: :btree
  add_index "link_scene_keywords", ["scene_keywords_id"], name: "fk_link_scene_keywords_scene_keywords", using: :btree

  create_table "link_scene_model", primary_key: "link_scene_model_id", force: :cascade do |t|
    t.integer "scene_id", limit: 4, null: false
    t.integer "model_id", limit: 4, null: false
  end

  add_index "link_scene_model", ["model_id"], name: "fk_link_scene_model_model", using: :btree
  add_index "link_scene_model", ["scene_id"], name: "fk_link_scene_model_scene", using: :btree

  create_table "link_scene_movie", primary_key: "link_scene_movie_id", force: :cascade do |t|
    t.integer "scene_id", limit: 4, null: false
    t.integer "movie_id", limit: 4, null: false
    t.integer "number",   limit: 4, null: false
  end

  add_index "link_scene_movie", ["movie_id"], name: "fk_link_scene_movie_movie", using: :btree
  add_index "link_scene_movie", ["scene_id", "movie_id"], name: "unique-scene-movie", unique: true, using: :btree
  add_index "link_scene_movie", ["scene_id"], name: "fk_link_scene_movie_scene", using: :btree

  create_table "link_scene_subgenre_genre", primary_key: "link_scene_subgenre_genre_id", force: :cascade do |t|
    t.integer "link_scene_genre_id", limit: 4, null: false
    t.integer "scene_subgenre_id",   limit: 4, null: false
  end

  add_index "link_scene_subgenre_genre", ["link_scene_genre_id"], name: "fk_link_scene_subgenre_genre_link_scene_genre", using: :btree
  add_index "link_scene_subgenre_genre", ["scene_subgenre_id"], name: "fk_link_scene_subgenre_genre_scene_subgenre", using: :btree

  create_table "link_tag_brick", primary_key: "link_tag_brick_id", force: :cascade do |t|
    t.integer "tag_id",                             limit: 4,                 null: false
    t.integer "tag_brick_id",                       limit: 4,                 null: false
    t.integer "weight",                             limit: 4, default: 0,     null: false
    t.boolean "direct_link",                        limit: 1, default: false, null: false
    t.integer "link_tag_target_object_property_id", limit: 4
    t.integer "link_tag_target_object_keyword_id",  limit: 4
    t.boolean "automatic",                          limit: 1, default: false, null: false
  end

  add_index "link_tag_brick", ["link_tag_target_object_keyword_id"], name: "fk_link_tag_brick_keyw_rule", using: :btree
  add_index "link_tag_brick", ["link_tag_target_object_property_id"], name: "fk_link_tag_brick_top_rule", using: :btree
  add_index "link_tag_brick", ["tag_brick_id"], name: "fk_link_bts_tag_brick_bts_brick1", using: :btree
  add_index "link_tag_brick", ["tag_id", "tag_brick_id"], name: "tag_id", unique: true, using: :btree
  add_index "link_tag_brick", ["tag_id"], name: "fk_link_bts_tag_brick_bts_tag", using: :btree

  create_table "link_tag_content", primary_key: "link_tag_content_id", force: :cascade do |t|
    t.integer "tag_id",     limit: 4,                 null: false
    t.integer "content_id", limit: 4,                 null: false
    t.integer "weight",     limit: 4, default: 0,     null: false
    t.boolean "automatic",  limit: 1, default: false, null: false
  end

  add_index "link_tag_content", ["tag_id", "content_id"], name: "tag_id", unique: true, using: :btree
  add_index "link_tag_content", ["tag_id"], name: "fk_link_bts_tag_content_bts_tag1", using: :btree

  create_table "link_tag_object", primary_key: "link_tag_object_id", force: :cascade do |t|
    t.integer "tag_id",       limit: 4,                   null: false
    t.string  "object_table", limit: 100,                 null: false
    t.integer "object_id",    limit: 4,                   null: false
    t.integer "weight",       limit: 4,   default: 1,     null: false
    t.boolean "automatic",    limit: 1,   default: false, null: false
  end

  add_index "link_tag_object", ["tag_id", "object_table", "object_id"], name: "tag_id", unique: true, using: :btree
  add_index "link_tag_object", ["tag_id"], name: "fk_link_bts_tag_object_bts_tag1", using: :btree

  create_table "link_tag_target_object_keyword", primary_key: "link_tag_target_object_keyword_id", force: :cascade do |t|
    t.integer "tag_target_object_id", limit: 4,                     null: false
    t.integer "tag_keyword_id",       limit: 4,                     null: false
    t.integer "weight",               limit: 4,     default: 1,     null: false
    t.boolean "direct",               limit: 1,     default: false, null: false
    t.boolean "stats_on",             limit: 1,     default: false, null: false
    t.text    "object_constraint",    limit: 65535
  end

  add_index "link_tag_target_object_keyword", ["tag_keyword_id"], name: "fk_link_tag_target_object_keyword_tag_keyword1", using: :btree
  add_index "link_tag_target_object_keyword", ["tag_target_object_id"], name: "fk_link_tag_target_object_keyword_tag_target_object1", using: :btree

  create_table "link_tag_target_object_property", primary_key: "link_tag_target_object_property_id", force: :cascade do |t|
    t.integer "tag_target_object_id",   limit: 4,                     null: false
    t.integer "tag_object_property_id", limit: 4,                     null: false
    t.integer "weight",                 limit: 4,     default: 1,     null: false
    t.boolean "direct",                 limit: 1,     default: false, null: false
    t.text    "join_text",              limit: 65535,                 null: false
    t.string  "description",            limit: 100
    t.boolean "stats_on",               limit: 1,     default: false, null: false
  end

  add_index "link_tag_target_object_property", ["tag_object_property_id"], name: "fk_link_tag_target_object_property_tag_object_property1", using: :btree
  add_index "link_tag_target_object_property", ["tag_target_object_id"], name: "fk_link_tag_target_object_property_tag_target_object1", using: :btree

  create_table "link_user_devoted", primary_key: "link_user_devoted_id", force: :cascade do |t|
    t.integer "link_id",        limit: 4,             null: false
    t.string  "link_type",      limit: 6,             null: false
    t.integer "userid",         limit: 4,             null: false
    t.integer "automatic_link", limit: 4, default: 0, null: false
  end

  create_table "link_video_encoding_file_object_type", primary_key: "link_video_encoding_file_object_type_id", force: :cascade do |t|
    t.integer "video_encoding_id",   limit: 4, null: false
    t.integer "file_object_type_id", limit: 4, null: false
  end

  add_index "link_video_encoding_file_object_type", ["file_object_type_id"], name: "fk_link_video_encoding_file_object_type_file_object_type", using: :btree
  add_index "link_video_encoding_file_object_type", ["video_encoding_id"], name: "fk_link_video_encoding_file_object_type_video_encoding", using: :btree

  create_table "link_website_company", primary_key: "link_website_company_id", force: :cascade do |t|
    t.integer "website_id",       limit: 4,                null: false
    t.integer "company_id",       limit: 4,                null: false
    t.string  "owner",            limit: 1,                null: false
    t.string  "release",          limit: 1,                null: false
    t.string  "financial_access", limit: 3, default: "no", null: false
  end

  add_index "link_website_company", ["company_id"], name: "fk_link_website_company_company", using: :btree
  add_index "link_website_company", ["website_id"], name: "fk_link_website_company_website", using: :btree

  create_table "link_website_user_content", primary_key: "link_website_user_content_id", force: :cascade do |t|
    t.integer "content_id",                               limit: 4, null: false
    t.integer "website_user_id",                          limit: 4, null: false
    t.integer "website_user_content_permission_group_id", limit: 4, null: false
  end

  add_index "link_website_user_content", ["content_id"], name: "fk_content_id", using: :btree
  add_index "link_website_user_content", ["website_user_content_permission_group_id"], name: "fk_website_user_content_permission_group_id", using: :btree
  add_index "link_website_user_content", ["website_user_id"], name: "fk_website_user_id", using: :btree

  create_table "link_website_user_custom_price", primary_key: "link_website_user_custom_price_id", force: :cascade do |t|
    t.integer  "link_website_user_id", limit: 4,  null: false
    t.integer  "product_offer_id",     limit: 4,  null: false
    t.float    "price",                limit: 24
    t.float    "recharge_price",       limit: 24
    t.datetime "expiration"
  end

  add_index "link_website_user_custom_price", ["link_website_user_id", "product_offer_id"], name: "unique_offer", unique: true, using: :btree
  add_index "link_website_user_custom_price", ["link_website_user_id"], name: "fk_link_website_user_custom_price_link_website_user1", using: :btree
  add_index "link_website_user_custom_price", ["product_offer_id"], name: "fk_link_website_user_custom_price_product_offer1", using: :btree

  create_table "link_website_user_forum", primary_key: "link_website_user_forum_id", force: :cascade do |t|
    t.integer  "website_user_id", limit: 4, null: false
    t.integer  "userid",          limit: 4, null: false
    t.datetime "created",                   null: false
  end

  add_index "link_website_user_forum", ["website_user_id"], name: "fk_link_website_user_forum_website_user", using: :btree

  create_table "link_website_user_has_notification_event", id: false, force: :cascade do |t|
    t.integer  "link_website_user_id",  limit: 4, null: false
    t.integer  "notification_event_id", limit: 4, null: false
    t.datetime "last_notification"
  end

  add_index "link_website_user_has_notification_event", ["link_website_user_id"], name: "fk_link_website_user_has_notification_event_link_website_user1", using: :btree
  add_index "link_website_user_has_notification_event", ["notification_event_id"], name: "fk_link_website_user_has_notification_event_notification_event1", using: :btree

  create_table "link_website_user_permission_group", primary_key: "link_website_user_permission_group_id", force: :cascade do |t|
    t.integer "website_user_id",     limit: 4, null: false
    t.integer "permission_group_id", limit: 4, null: false
  end

  add_index "link_website_user_permission_group", ["permission_group_id"], name: "permission_group_id", using: :btree
  add_index "link_website_user_permission_group", ["website_user_id"], name: "website_user_id", using: :btree

  create_table "log_import", primary_key: "log_import_id", force: :cascade do |t|
    t.integer  "type_id",    limit: 4, null: false
    t.integer  "old_id",     limit: 4, null: false
    t.integer  "new_id",     limit: 4, null: false
    t.integer  "content_id", limit: 4
    t.datetime "date",                 null: false
  end

  add_index "log_import", ["content_id"], name: "content_id", using: :btree
  add_index "log_import", ["new_id"], name: "new_id", using: :btree
  add_index "log_import", ["old_id"], name: "old_id", using: :btree
  add_index "log_import", ["type_id"], name: "log_import_FK1", using: :btree
  add_index "log_import", ["type_id"], name: "type", using: :btree

  create_table "media_casting2", primary_key: "media_id", force: :cascade do |t|
    t.integer "content_id",        limit: 4, null: false
    t.integer "clicks",            limit: 4, null: false
    t.integer "views",             limit: 4, null: false
    t.boolean "is_best_thumbnail", limit: 1, null: false
  end

  add_index "media_casting2", ["content_id"], name: "content_id", using: :btree
  add_index "media_casting2", ["is_best_thumbnail"], name: "is_best_thumbnail", using: :btree

  create_table "media_casting2_result", primary_key: "media_casting2_result_id", force: :cascade do |t|
    t.integer  "content_id",        limit: 4,   null: false
    t.datetime "created",                       null: false
    t.string   "consistency_state", limit: 7
    t.string   "consistency_error", limit: 255
  end

  add_index "media_casting2_result", ["content_id"], name: "media_casting2_result_content_id", using: :btree

  create_table "media_copy", id: false, force: :cascade do |t|
    t.integer "media_id",               limit: 4,   default: 0,  null: false
    t.integer "media_type_id",          limit: 4,                null: false
    t.integer "source_media_id",        limit: 4
    t.string  "lighttp_options",        limit: 45
    t.integer "comments",               limit: 4,                null: false
    t.integer "ratings",                limit: 4,                null: false
    t.integer "average_rating",         limit: 4,                null: false
    t.integer "views",                  limit: 4,                null: false
    t.integer "downloads",              limit: 4,                null: false
    t.string  "hot",                    limit: 1,                null: false
    t.integer "peers",                  limit: 4,                null: false
    t.integer "seeds",                  limit: 4,                null: false
    t.integer "gallery_group",          limit: 1,   default: 0,  null: false
    t.integer "gallery_rate",           limit: 1,   default: -1, null: false
    t.integer "dead",                   limit: 1,   default: 0,  null: false
    t.string  "title",                  limit: 127
    t.string  "description",            limit: 255
    t.integer "thumbnail_clicks_count", limit: 4,   default: 0,  null: false
  end

  create_table "media_has_keyword", id: false, force: :cascade do |t|
    t.integer "media_id",  limit: 4, null: false
    t.integer "keword_id", limit: 4, null: false
  end

  add_index "media_has_keyword", ["keword_id"], name: "fk_media_has_keyword_keyword_id", using: :btree
  add_index "media_has_keyword", ["keword_id"], name: "keywo", using: :btree
  add_index "media_has_keyword", ["media_id"], name: "fk_media_has_keyword_media_id", using: :btree

  create_table "media_has_model", id: false, force: :cascade do |t|
    t.integer "model_id", limit: 4, null: false
    t.integer "media_id", limit: 4, null: false
  end

  add_index "media_has_model", ["media_id"], name: "fk_media_has_model_media_id", using: :btree
  add_index "media_has_model", ["model_id"], name: "fk_media_has_model_model_id", using: :btree

  create_table "media_info", primary_key: "media_info_id", force: :cascade do |t|
    t.integer "media_id",    limit: 4,   null: false
    t.string  "title",       limit: 127, null: false
    t.string  "description", limit: 255, null: false
  end

  add_index "media_info", ["media_id"], name: "fk_media_info_media", using: :btree
  add_index "media_info", ["media_id"], name: "media_id", unique: true, using: :btree

  create_table "media_rating", primary_key: "media_rating_id", force: :cascade do |t|
    t.integer  "media_id",        limit: 4, null: false
    t.integer  "website_user_id", limit: 4, null: false
    t.datetime "created",                   null: false
    t.integer  "rating",          limit: 4, null: false
  end

  add_index "media_rating", ["media_id"], name: "fk_media_rating_media", using: :btree
  add_index "media_rating", ["website_user_id"], name: "fk_media_rating_website_user", using: :btree

  create_table "media_thumbnail_cache", primary_key: "media_id", force: :cascade do |t|
    t.integer "content_id",                      limit: 4,                 null: false
    t.string  "main_thumbnail_image",            limit: 255
    t.string  "playshot_image",                  limit: 255
    t.string  "thumbnails_set",                  limit: 255
    t.string  "timeline_image",                  limit: 255
    t.text    "timeline_json",                   limit: 65535,             null: false
    t.integer "media_imagecount",                limit: 4,     default: 0
    t.integer "media_imagerank",                 limit: 4,     default: 0
    t.integer "content_imagecount",              limit: 4,     default: 0
    t.integer "content_imagerank",               limit: 4,     default: 0
    t.integer "content_thumbnails_clicks_count", limit: 4,     default: 0, null: false
    t.integer "media_thumbnails_clicks_count",   limit: 4,     default: 0, null: false
    t.integer "last_timeline_id",                limit: 4
  end

  add_index "media_thumbnail_cache", ["content_id"], name: "content_id", using: :btree

  create_table "menu", primary_key: "menu_id", force: :cascade do |t|
    t.integer "menu_area_id",  limit: 4,   null: false
    t.string  "title",         limit: 64,  null: false
    t.string  "image",         limit: 64,  null: false
    t.string  "url",           limit: 128, null: false
    t.integer "permission_id", limit: 4,   null: false
    t.integer "order_index",   limit: 3,   null: false
  end

  create_table "menu_area", primary_key: "menu_area_id", force: :cascade do |t|
    t.string  "title",         limit: 64, null: false
    t.integer "permission_id", limit: 4,  null: false
    t.integer "order_index",   limit: 3,  null: false
  end

  create_table "message", primary_key: "message_id", force: :cascade do |t|
    t.integer  "sender_user_id", limit: 4
    t.string   "sender",         limit: 45
    t.string   "subject",        limit: 100
    t.string   "short_info",     limit: 80
    t.text     "text",           limit: 65535
    t.datetime "created"
    t.string   "tag",            limit: 45
  end

  add_index "message", ["sender_user_id"], name: "fk_message_user1", using: :btree
  add_index "message", ["tag"], name: "tag_index", using: :btree


  create_table "model_ids", primary_key: "model_ids_id", force: :cascade do |t|
    t.string "type",   limit: 22
    t.string "serie",  limit: 12, null: false
    t.string "number", limit: 30, null: false
  end

  create_table "model_social_network", primary_key: "model_social_network_id", force: :cascade do |t|
    t.integer "model_id",           limit: 4,   null: false
    t.integer "social_network_id",  limit: 4,   null: false
    t.string  "url",                limit: 255
    t.string  "login",              limit: 255
    t.string  "password",           limit: 255
    t.string  "oauth_token",        limit: 128
    t.string  "oauth_token_secret", limit: 128
  end

  add_index "model_social_network", ["model_id"], name: "fk_model_social_network_model1_idx", using: :btree
  add_index "model_social_network", ["social_network_id"], name: "fk_model_social_network_social_network1_idx", using: :btree

  create_table "model_stage_name", primary_key: "model_stage_name_id", force: :cascade do |t|
    t.string  "stage_name",    limit: 30, null: false
    t.integer "priority",      limit: 4,  null: false
    t.integer "external_data", limit: 4,  null: false
  end

  add_index "model_stage_name", ["external_data"], name: "in_external_data", using: :btree

  create_table "movie", primary_key: "movie_id", force: :cascade do |t|
    t.integer  "content_id",         limit: 4,                      null: false
    t.integer  "line_id",            limit: 4,                      null: false
    t.integer  "number",             limit: 4,                      null: false
    t.string   "description",        limit: 200,                    null: false
    t.integer  "barcode",            limit: 4,                      null: false
    t.time     "runtime",                                           null: false
    t.string   "code",               limit: 20,                     null: false
    t.string   "name",               limit: 128,                    null: false
    t.datetime "created",                                           null: false
    t.date     "date_of_production"
    t.integer  "external_data",      limit: 4,                      null: false
    t.string   "movie_status",       limit: 8,   default: "opened", null: false
  end

  add_index "movie", ["content_id"], name: "content_id", unique: true, using: :btree
  add_index "movie", ["content_id"], name: "fk_movie_content", using: :btree
  add_index "movie", ["external_data"], name: "in_external_data", using: :btree
  add_index "movie", ["line_id"], name: "fk_movie_line", using: :btree

  create_table "niche", primary_key: "niche_id", force: :cascade do |t|
    t.string "name",  limit: 50, null: false
    t.string "alias", limit: 50, null: false
  end

  create_table "notification_event", primary_key: "notification_event_id", force: :cascade do |t|
    t.string "event",          limit: 250
    t.string "constant",       limit: 100,   null: false
    t.string "message_option", limit: 13
    t.string "email_option",   limit: 13
    t.text   "description",    limit: 65535
  end

  add_index "notification_event", ["constant"], name: "not_ev_constant", unique: true, using: :btree

  create_table "notification_template", primary_key: "notification_template_id", force: :cascade do |t|
    t.string "template_name",               limit: 100,   null: false
    t.string "constant",                    limit: 45,    null: false
    t.string "template_class",              limit: 45
    t.string "title",                       limit: 250
    t.text   "template",                    limit: 65535
    t.string "sms_template",                limit: 250
    t.string "notification_event_constant", limit: 100
  end

  add_index "notification_template", ["constant", "template_class"], name: "Constant", unique: true, using: :btree
  add_index "notification_template", ["notification_event_constant"], name: "fk_notification_template_notification_event1", using: :btree

  create_table "object_property", primary_key: "object_property_id", force: :cascade do |t|
    t.integer "object_id",            limit: 4,          default: 0, null: false
    t.string  "object_type",          limit: 32,                     null: false
    t.string  "object_property_name", limit: 64,                     null: false
    t.integer "property_int",         limit: 4
    t.text    "property_text",        limit: 4294967295
  end

  add_index "object_property", ["object_property_name"], name: "fk_object_property_name", using: :btree
  add_index "object_property", ["object_type"], name: "fk_object_type", using: :btree

  create_table "object_property_name", primary_key: "object_property_name", force: :cascade do |t|
    t.string "object_type", limit: 32, null: false
  end

  add_index "object_property_name", ["object_type"], name: "fk_property_name_object_type", using: :btree

  create_table "object_type", primary_key: "object_type", force: :cascade do |t|
  end

  create_table "old_movies", id: false, force: :cascade do |t|
    t.integer  "MovieID",                       limit: 3,                                  default: 0,     null: false
    t.integer  "Purchases",                     limit: 2,                                  default: 0,     null: false
    t.integer  "MovieSeriesID",                 limit: 4,                                  default: 0,     null: false
    t.boolean  "CategoryID",                    limit: 1,                                  default: true,  null: false
    t.string   "PartNum",                       limit: 50,                                 default: "",    null: false
    t.string   "Title",                         limit: 255,                                default: "",    null: false
    t.string   "SubTitle",                      limit: 255,                                default: "",    null: false
    t.integer  "DirectorID",                    limit: 2,                                  default: 0,     null: false
    t.date     "DOP"
    t.date     "DOR"
    t.time     "Runtime"
    t.boolean  "WebsiteSubscriptionID",         limit: 1,                                  default: false, null: false
    t.boolean  "DownloadWebsiteSubscriptionID", limit: 1,                                  default: false, null: false
    t.boolean  "Trailer",                       limit: 1,                                  default: false, null: false
    t.boolean  "VOD",                           limit: 1,                                  default: false, null: false
    t.boolean  "VDL",                           limit: 1,                                  default: false, null: false
    t.decimal  "DVDPrice",                                         precision: 5, scale: 2, default: 0.0,   null: false
    t.decimal  "DVDOurPrice",                                      precision: 5, scale: 2, default: 0.0,   null: false
    t.decimal  "DVDSalePrice",                                     precision: 5, scale: 2, default: 0.0,   null: false
    t.decimal  "VHSPrice",                                         precision: 5, scale: 2, default: 0.0,   null: false
    t.decimal  "VHSOurPrice",                                      precision: 5, scale: 2, default: 0.0,   null: false
    t.decimal  "VHSSalePrice",                                     precision: 5, scale: 2, default: 0.0,   null: false
    t.text     "Description",                   limit: 4294967295,                                         null: false
    t.integer  "ShippingDelay",                 limit: 1,                                  default: 0,     null: false
    t.boolean  "Chromes",                       limit: 1,                                  default: false, null: false
    t.integer  "AddAccountID",                  limit: 2,                                  default: 0,     null: false
    t.datetime "AddDate"
    t.integer  "UpdateAccountID",               limit: 2,                                  default: 0,     null: false
    t.datetime "UpdateDate"
    t.string   "SeriesTitle",                   limit: 255,                                default: "",    null: false
    t.integer  "new_movie_id",                  limit: 4,                                  default: 0,     null: false
  end

  add_index "old_movies", ["CategoryID"], name: "CategoryID", using: :btree
  add_index "old_movies", ["MovieID"], name: "i", using: :btree
  add_index "old_movies", ["Title"], name: "t", type: :fulltext

  create_table "page", primary_key: "page_id", force: :cascade do |t|
    t.string  "type",               limit: 12,                     null: false
    t.string  "sef_slug",           limit: 1000
    t.integer "site_id",            limit: 4
    t.string  "screenshots_status", limit: 6,    default: "renew", null: false
    t.string  "photos_status",      limit: 6,    default: "renew", null: false
  end

  add_index "page", ["site_id"], name: "fk_page_site1", using: :btree

  create_table "page_has_media", id: false, force: :cascade do |t|
    t.integer "page_id",  limit: 4,             null: false
    t.integer "media_id", limit: 4,             null: false
    t.integer "position", limit: 1, default: 0, null: false
  end

  add_index "page_has_media", ["media_id"], name: "fk_page_has_media_media1", using: :btree
  add_index "page_has_media", ["page_id"], name: "fk_page_has_media_page1", using: :btree

  create_table "permission", primary_key: "permission_id", force: :cascade do |t|
    t.string "name",             limit: 50,                            null: false
    t.string "constant",         limit: 45,                            null: false
    t.string "description",      limit: 80,                            null: false
    t.string "permission_scope", limit: 13,  default: "internal_user", null: false
    t.string "resource",         limit: 45
    t.string "privileges_list",  limit: 500, default: "view,manage"
  end

  create_table "poll", primary_key: "poll_id", force: :cascade do |t|
    t.text "question", limit: 65535, null: false
  end

  create_table "poll_answer", primary_key: "poll_answer_id", force: :cascade do |t|
    t.integer "poll_id", limit: 4,     null: false
    t.text    "answer",  limit: 65535, null: false
    t.string  "link",    limit: 120
  end

  add_index "poll_answer", ["poll_id"], name: "poll_id", using: :btree

  create_table "poster_account_log", primary_key: "poster_account_log_id", force: :cascade do |t|
    t.integer  "social_network_account_id", limit: 4
    t.integer  "content_release_id",        limit: 4,                     null: false
    t.integer  "poster_data_log_id",        limit: 4,                     null: false
    t.string   "is_posted_ok",              limit: 3,                     null: false
    t.string   "link_to_post",              limit: 256
    t.string   "is_account_ok",             limit: 3,     default: "yes", null: false
    t.text     "log",                       limit: 65535,                 null: false
    t.datetime "created",                                                 null: false
  end

  add_index "poster_account_log", ["content_release_id"], name: "content_Releae_fak_idx", using: :btree
  add_index "poster_account_log", ["poster_data_log_id"], name: "poster_data_log_fak_idx", using: :btree
  add_index "poster_account_log", ["social_network_account_id"], name: "social_netowork_fka_idx", using: :btree

  create_table "poster_data_log", primary_key: "poster_data_log_id", force: :cascade do |t|
    t.integer  "content_id",    limit: 4,                     null: false
    t.string   "tags_ok",       limit: 3,     default: "yes", null: false
    t.string   "models_ok",     limit: 3,     default: "yes", null: false
    t.string   "link_ok",       limit: 3,     default: "yes", null: false
    t.string   "scene_name_ok", limit: 3,     default: "yes", null: false
    t.string   "thumbnail_ok",  limit: 3,     default: "yes", null: false
    t.string   "gallery_ok",    limit: 3,     default: "yes", null: false
    t.text     "log",           limit: 65535,                 null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "poster_data_log", ["content_id"], name: "content_release_id_fk_idx", using: :btree

  create_table "poster_task", primary_key: "poster_task_id", force: :cascade do |t|
    t.string   "status",             limit: 10, default: "waiting", null: false
    t.datetime "created",                                           null: false
    t.datetime "started"
    t.datetime "finished"
    t.integer  "content_release_id", limit: 4,                      null: false
  end

  add_index "poster_task", ["content_release_id"], name: "cont_rel_id_idx", using: :btree

  create_table "ppm_permission", primary_key: "ppm_permission_id", force: :cascade do |t|
    t.integer "website_user_id",                 limit: 4,  null: false
    t.integer "website_session_id",              limit: 4,  null: false
    t.string  "userid",                          limit: 45, null: false
    t.string  "password",                        limit: 45, null: false
    t.integer "debited_time",                    limit: 4,  null: false
    t.integer "last_resource_activation_log_id", limit: 4
  end

  add_index "ppm_permission", ["website_session_id"], name: "website_session_id", using: :btree
  add_index "ppm_permission", ["website_user_id"], name: "fk_ppm_permission_website_user", using: :btree

  create_table "preview_counter", primary_key: "preview_counter_id", force: :cascade do |t|
    t.datetime "created",                                     null: false
    t.string   "ip_address",           limit: 45,             null: false
    t.string   "http_x_forwarded_for", limit: 64
    t.integer  "previews_count",       limit: 1,  default: 0, null: false
    t.integer  "previews_limit",       limit: 1,  default: 1, null: false
    t.datetime "expires"
  end

  add_index "preview_counter", ["ip_address"], name: "preview_counter_ip_address", using: :btree

  create_table "product", primary_key: "product_id", force: :cascade do |t|
    t.integer "content_release_delay", limit: 4,                   null: false
    t.string  "name",                  limit: 30,                  null: false
    t.string  "constant",              limit: 45,                  null: false
    t.string  "target_type",           limit: 45
    t.string  "checkout_procedure",    limit: 30,                  null: false
    t.string  "icon",                  limit: 50,                  null: false
    t.string  "releases",              limit: 1,                   null: false
    t.string  "is_releasable",         limit: 3,   default: "no",  null: false
    t.string  "small_logo_path",       limit: 44
    t.string  "can_be_bought_twice",   limit: 3,   default: "yes", null: false
    t.string  "description",           limit: 255
  end

  add_index "product", ["constant"], name: "idx_constant_unique", unique: true, using: :btree

  create_table "product_bonus_program", primary_key: "product_bonus_program_id", force: :cascade do |t|
    t.string "name", limit: 45, null: false
  end

  create_table "product_bonus_website", primary_key: "product_bonus_website_id", force: :cascade do |t|
    t.integer "product_offer_website_id",  limit: 4,              null: false
    t.integer "product_count",             limit: 4,              null: false
    t.float   "product_price",             limit: 24,             null: false
    t.integer "discount_level",            limit: 4,              null: false
    t.integer "discount_level_expiration", limit: 4,              null: false
    t.float   "sinebucks",                 limit: 24,             null: false
    t.integer "sinebucks_expiration",      limit: 4,  default: 0, null: false
    t.string  "gallery_level",             limit: 1,              null: false
    t.integer "gallery_level_expiration",  limit: 4,              null: false
    t.float   "upgrade_gallery_level1",    limit: 24,             null: false
  end

  add_index "product_bonus_website", ["product_offer_website_id"], name: "fk_product_bonus_website_product_offer_website", using: :btree

  create_table "product_offer", primary_key: "product_offer_id", force: :cascade do |t|
    t.string  "active",                           limit: 1,                    null: false
    t.integer "product_id",                       limit: 4,                    null: false
    t.integer "content_type_id",                  limit: 4,                    null: false
    t.string  "file_object_type_family_category", limit: 11
    t.integer "quantity",                         limit: 4,                    null: false
    t.string  "name",                             limit: 45,                   null: false
    t.string  "technical_name",                   limit: 45
    t.string  "constant",                         limit: 45,                   null: false
    t.float   "price",                            limit: 24,                   null: false
    t.integer "expires",                          limit: 4,                    null: false
    t.string  "is_recurring",                     limit: 3,     default: "no", null: false
    t.float   "recharge_price",                   limit: 24,                   null: false
    t.string  "mode",                             limit: 100
    t.text    "json_options",                     limit: 65535
  end

  add_index "product_offer", ["constant"], name: "idx_constant_unique", unique: true, using: :btree
  add_index "product_offer", ["content_type_id"], name: "fk_product_offer_content_type", using: :btree
  add_index "product_offer", ["product_id"], name: "fk_product_offer_product", using: :btree

  create_table "product_offer_availability_condition", primary_key: "product_offer_availability_condition_id", force: :cascade do |t|
    t.string  "subject_type",        limit: 7, null: false
    t.integer "subject_id",          limit: 4
    t.string  "condition_operation", limit: 2
    t.integer "int_value",           limit: 4
  end

  create_table "product_offer_website", primary_key: "product_offer_website_id", force: :cascade do |t|
    t.integer "product_offer_id", limit: 4,                 null: false
    t.integer "website_id",       limit: 4,                 null: false
    t.string  "state",            limit: 3,  default: "on", null: false
    t.float   "price",            limit: 24,                null: false
    t.float   "recharge_price",   limit: 24,                null: false
  end

  add_index "product_offer_website", ["product_offer_id"], name: "fk_product_offer_website_product_offer", using: :btree
  add_index "product_offer_website", ["website_id"], name: "fk_product_offer_website_website", using: :btree

  create_table "product_offer_website_bonus", primary_key: "product_offer_website_bonus_id", force: :cascade do |t|
    t.integer "product_offer_website_id",  limit: 4
    t.integer "product_bonus_program_id",  limit: 4
    t.string  "name",                      limit: 45
    t.integer "previously_bought_count",   limit: 4,  default: 0,       null: false
    t.integer "discount_level",            limit: 4,  default: 0,       null: false
    t.integer "discount_level_expiration", limit: 4,  default: 0,       null: false
    t.float   "sinebucks",                 limit: 24, default: 0.0,     null: false
    t.string  "sinebucks_type",            limit: 7,  default: "fixed", null: false
    t.integer "sinebucks_expiration",      limit: 4,  default: 0,       null: false
    t.string  "gallery_level",             limit: 1
    t.integer "gallery_level_expiration",  limit: 4,  default: 0,       null: false
  end

  add_index "product_offer_website_bonus", ["product_bonus_program_id"], name: "fk_product_offer_website_bonus_product_bonus_program1", using: :btree
  add_index "product_offer_website_bonus", ["product_offer_website_id"], name: "fk_product_bonus_website_product_offer_website1", using: :btree

  create_table "product_offer_website_bonus_custom_price", primary_key: "product_offer_website_bonus_custom_price_id", force: :cascade do |t|
    t.integer "product_offer_website_bonus_id", limit: 4,  null: false
    t.integer "product_offer_id",               limit: 4,  null: false
    t.float   "price",                          limit: 24
    t.float   "recharge_price",                 limit: 24
    t.integer "expires",                        limit: 4,  null: false
  end

  add_index "product_offer_website_bonus_custom_price", ["product_offer_id"], name: "fk_product_offer_website_bonus_custom_price_product_offer1", using: :btree
  add_index "product_offer_website_bonus_custom_price", ["product_offer_website_bonus_id"], name: "fk_product_offer_website_bonus_custom_price_product_offer_web1", using: :btree

  create_table "product_offer_website_has_bonus", id: false, force: :cascade do |t|
    t.integer "product_offer_website_id",       limit: 4, null: false
    t.integer "product_offer_website_bonus_id", limit: 4, null: false
  end

  add_index "product_offer_website_has_bonus", ["product_offer_website_bonus_id"], name: "fk_product_offer_website_has_product_offer_website_bonus_prod2", using: :btree
  add_index "product_offer_website_has_bonus", ["product_offer_website_id"], name: "fk_product_offer_website_has_product_offer_website_bonus_prod1", using: :btree

  create_table "product_offer_website_has_bonus_program", id: false, force: :cascade do |t|
    t.integer "product_offer_website_id", limit: 4, null: false
    t.integer "product_bonus_program_id", limit: 4, null: false
  end

  add_index "product_offer_website_has_bonus_program", ["product_bonus_program_id"], name: "fk_product_offer_website_has_product_bonus_program_product_bo1", using: :btree

  create_table "product_offer_website_prize", primary_key: "product_offer_website_prize_id", force: :cascade do |t|
    t.integer "product_offer_website_id", limit: 4, null: false
  end

  add_index "product_offer_website_prize", ["product_offer_website_id"], name: "fk_product_bonus_offer_website_product_offer_website1", using: :btree

  create_table "product_package", primary_key: "product_package_id", force: :cascade do |t|
    t.integer  "content_id", limit: 4,   null: false
    t.string   "name",       limit: 100, null: false
    t.float    "price",      limit: 24,  null: false
    t.integer  "items",      limit: 4,   null: false
    t.datetime "expire"
  end

  add_index "product_package", ["content_id"], name: "content_id", unique: true, using: :btree
  add_index "product_package", ["content_id"], name: "fk_product_package_content1", using: :btree

  create_table "product_package_business_rule_class_decline", id: false, force: :cascade do |t|
    t.integer "product_package_id",     limit: 4,                null: false
    t.integer "business_rule_class_id", limit: 4,                null: false
    t.boolean "decline",                limit: 1, default: true, null: false
  end

  add_index "product_package_business_rule_class_decline", ["business_rule_class_id"], name: "fk_link_business_rule_class_product_package_business_rule_cla1", using: :btree
  add_index "product_package_business_rule_class_decline", ["product_package_id"], name: "fk_link_business_rule_class_product_package_product_package1", using: :btree

  create_table "product_package_item", primary_key: "product_package_item_id", force: :cascade do |t|
    t.integer "product_package_id", limit: 4,  null: false
    t.integer "product_offer_id",   limit: 4,  null: false
    t.integer "resource_id",        limit: 4
    t.string  "name",               limit: 45, null: false
  end

  add_index "product_package_item", ["product_offer_id"], name: "fk_product_package_item_product_offer1", using: :btree
  add_index "product_package_item", ["product_package_id"], name: "fk_product_package_item_product_package1", using: :btree

  create_table "product_price_group", primary_key: "product_price_group_id", force: :cascade do |t|
    t.string "name",      limit: 200
    t.float  "min_value", limit: 24
  end

  create_table "product_price_rule", primary_key: "product_price_rule_id", force: :cascade do |t|
    t.integer "product_id",             limit: 4
    t.integer "product_price_group_id", limit: 4
    t.string  "rule_link_type",         limit: 24
    t.string  "rule_link_value",        limit: 200
    t.string  "rule_action_type",       limit: 20
    t.float   "rule_action_value",      limit: 24
    t.integer "packet_number",          limit: 4
  end

  add_index "product_price_rule", ["product_id"], name: "fk_product", using: :btree
  add_index "product_price_rule", ["product_price_group_id"], name: "fk_product_price_group", using: :btree

  create_table "product_price_smoothing", primary_key: "product_price_smoothing_id", force: :cascade do |t|
    t.float "bottom_price", limit: 24, null: false
    t.float "smooth_to",    limit: 24, null: false
  end

  create_table "product_website", primary_key: "product_website_id", force: :cascade do |t|
    t.integer "product_id",            limit: 4,                null: false
    t.integer "website_id",            limit: 4,                null: false
    t.string  "releases",              limit: 1,                null: false
    t.string  "is_releasable",         limit: 3, default: "no", null: false
    t.integer "content_release_delay", limit: 4,                null: false
  end

  add_index "product_website", ["product_id"], name: "fk_product_website_sale_product_content_sale", using: :btree
  add_index "product_website", ["website_id"], name: "fk_product_website_sale_website", using: :btree

  create_table "resource_type", primary_key: "resource_type_id", force: :cascade do |t|
    t.string "name",                         limit: 100,               null: false
    t.string "constant",                     limit: 100,               null: false
    t.string "description",                  limit: 255
    t.float  "reset_on_expiration_to_value", limit: 24,  default: 0.0, null: false
  end

  add_index "resource_type", ["constant"], name: "idx_constant_unique", unique: true, using: :btree


  # create_table "scene_genre", primary_key: "scene_genre_id", force: :cascade do |t|
  #   t.integer "company_id",    limit: 4,              null: false
  #   t.string  "name",          limit: 45,             null: false
  #   t.string  "public",        limit: 1
  #   t.integer "external_data", limit: 4,              null: false
  #   t.integer "content_id",    limit: 4
  #   t.integer "sweetness",     limit: 1,  default: 1, null: false
  # end

  # add_index "scene_genre", ["company_id"], name: "fk_scene_category_company", using: :btree
  # add_index "scene_genre", ["content_id"], name: "fk_scene_genre_content1", using: :btree
  # add_index "scene_genre", ["external_data"], name: "in_external_data", using: :btree

  create_table "scene_genre_synonym", primary_key: "scene_genre_synonym_id", force: :cascade do |t|
    t.integer "scene_genre_id", limit: 4,  null: false
    t.string  "synonym",        limit: 45, null: false
  end

  add_index "scene_genre_synonym", ["scene_genre_id"], name: "fk_scene_genre_synonym_scene_genre1", using: :btree


  create_table "scene_subgenre", primary_key: "scene_subgenre_id", force: :cascade do |t|
    t.integer "company_id",     limit: 4,  null: false
    t.integer "scene_genre_id", limit: 4,  null: false
    t.string  "name",           limit: 30, null: false
    t.string  "public",         limit: 1,  null: false
  end

  add_index "scene_subgenre", ["company_id"], name: "fk_scene_subgenre_company", using: :btree
  add_index "scene_subgenre", ["scene_genre_id"], name: "fk_scene_subgenre_scene_genre", using: :btree

  create_table "scheduler_log", primary_key: "scheduler_log_id", force: :cascade do |t|
    t.datetime "timestamp",                                 null: false
    t.string   "status",         limit: 5,   default: "ok", null: false
    t.string   "message",        limit: 255
    t.time     "execution_time"
  end

  create_table "sef_name", primary_key: "sef_name_id", force: :cascade do |t|
    t.string  "sef_name", limit: 100, null: false
    t.string  "table",    limit: 50,  null: false
    t.integer "row_id",   limit: 4,   null: false
  end

  add_index "sef_name", ["sef_name", "table"], name: "sef_name", unique: true, using: :btree

  create_table "shipping_address", primary_key: "shipping_address_id", force: :cascade do |t|
    t.integer "website_user_id", limit: 4,   null: false
    t.string  "city",            limit: 64
    t.string  "region",          limit: 64
    t.string  "zip",             limit: 6
    t.string  "street",          limit: 255
    t.string  "street2",         limit: 255
  end

  add_index "shipping_address", ["website_user_id"], name: "website_user_id", using: :btree

  create_table "sms_operator_request_new", primary_key: "sms_operator_request_new_id", force: :cascade do |t|
    t.integer  "website_user_id",       limit: 4
    t.string   "referer_url",           limit: 500, null: false
    t.string   "request_type",          limit: 8
    t.string   "request_value",         limit: 200
    t.datetime "create_date",                       null: false
    t.string   "country_name",          limit: 30
    t.string   "txt_nation_network_id", limit: 20
  end

  add_index "sms_operator_request_new", ["txt_nation_network_id"], name: "FK_sms_operator_request_new_txt_nation_network", using: :btree
  add_index "sms_operator_request_new", ["website_user_id"], name: "website_user_id", using: :btree

  create_table "social_network", primary_key: "social_network_id", force: :cascade do |t|
    t.string "name",        limit: 20, null: false
    t.string "is_required", limit: 3,  null: false
  end

  create_table "social_network_account", primary_key: "social_network_account_id", force: :cascade do |t|
    t.integer "social_network_id",  limit: 4,   null: false
    t.integer "content_id",         limit: 4,   null: false
    t.string  "url",                limit: 255
    t.string  "login",              limit: 255
    t.string  "password",           limit: 255
    t.string  "oauth_token",        limit: 128
    t.string  "oauth_token_secret", limit: 128
  end

  add_index "social_network_account", ["social_network_id"], name: "fk_model_social_network_social_network1_idx", using: :btree

  create_table "spent_time", primary_key: "spent_time_id", force: :cascade do |t|
    t.integer  "user_id",             limit: 4,     null: false
    t.integer  "user_schedule_id",    limit: 4
    t.integer  "content_id",          limit: 4
    t.integer  "file_object_type_id", limit: 4
    t.datetime "created",                           null: false
    t.datetime "updated"
    t.integer  "minutes",             limit: 4
    t.text     "comment",             limit: 65535
  end

  add_index "spent_time", ["content_id"], name: "fk_spent_time_content1", using: :btree
  add_index "spent_time", ["file_object_type_id"], name: "fk_spent_time_file_object_type1", using: :btree
  add_index "spent_time", ["user_id"], name: "fk_spent_time_user1", using: :btree
  add_index "spent_time", ["user_schedule_id"], name: "fk_spent_time_user_schedule1", using: :btree

  create_table "tag", primary_key: "tag_id", force: :cascade do |t|
    t.string  "tagtext",   limit: 100,                 null: false
    t.boolean "automatic", limit: 1,   default: false, null: false
  end

  add_index "tag", ["tagtext"], name: "tagtext", unique: true, using: :btree

  create_table "tag_brick", primary_key: "tag_brick_id", force: :cascade do |t|
    t.string  "word",      limit: 32,                 null: false
    t.boolean "automatic", limit: 1,  default: false, null: false
  end

  add_index "tag_brick", ["word"], name: "word", unique: true, using: :btree

  create_table "tag_keyword", primary_key: "tag_keyword_id", force: :cascade do |t|
    t.string "name", limit: 32, null: false
  end

  add_index "tag_keyword", ["name"], name: "name", unique: true, using: :btree

  create_table "tag_object_property", primary_key: "tag_object_property_id", force: :cascade do |t|
    t.string  "property_name",  limit: 255,             null: false
    t.string  "property_table", limit: 100,             null: false
    t.integer "child_count",    limit: 4,   default: 0, null: false
    t.string  "description",    limit: 100
  end

  create_table "tag_target_object", primary_key: "tag_target_object_id", force: :cascade do |t|
    t.string  "table_name",       limit: 100,                   null: false
    t.integer "property_weight",  limit: 4,     default: 1,     null: false
    t.string  "property_name",    limit: 100,   default: "",    null: false
    t.text    "property_sql",     limit: 65535,                 null: false
    t.boolean "use_property_sql", limit: 1,     default: false, null: false
    t.string  "target_object",    limit: 100,                   null: false
    t.string  "target_id_field",  limit: 100,                   null: false
    t.string  "description",      limit: 100
    t.integer "child_count",      limit: 4,     default: 0,     null: false
  end

  create_table "temp_media", primary_key: "media_id", force: :cascade do |t|
    t.integer "source_media_id",                  limit: 4
    t.integer "gallery_rate",                     limit: 1
    t.integer "gallery_group",                    limit: 1
    t.integer "average_rating",                   limit: 4
    t.integer "average_rating_plus_gallery_rate", limit: 4
    t.integer "clicks",                           limit: 4
    t.integer "ratings",                          limit: 4
  end

  add_index "temp_media", ["average_rating", "gallery_rate", "average_rating_plus_gallery_rate", "gallery_group"], name: "average_rating", using: :btree
  add_index "temp_media", ["clicks", "ratings"], name: "clicks", using: :btree
  add_index "temp_media", ["media_id"], name: "media_id", using: :btree
  add_index "temp_media", ["source_media_id", "average_rating", "gallery_rate", "average_rating_plus_gallery_rate", "gallery_group"], name: "source_media_id_2", using: :btree
  add_index "temp_media", ["source_media_id", "media_id", "gallery_rate", "gallery_group", "average_rating"], name: "source_media_id", using: :btree

  create_table "timeline", primary_key: "timeline_id", force: :cascade do |t|
    t.integer  "content_id",          limit: 4,     null: false
    t.integer  "image_id",            limit: 4,     null: false
    t.string   "image_path",          limit: 64,    null: false
    t.text     "timeline_filenames",  limit: 65535, null: false
    t.text     "timecodes_json",      limit: 65535, null: false
    t.string   "type",                limit: 15,    null: false
    t.integer  "click_count",         limit: 3,     null: false
    t.datetime "generated_timestamp",               null: false
  end

  add_index "timeline", ["content_id"], name: "content_id", using: :btree
  add_index "timeline", ["image_id"], name: "image_id", using: :btree

  create_table "timeline_has_media", primary_key: "timeline_has_media", force: :cascade do |t|
    t.integer "timeline_id", limit: 4, null: false
    t.integer "media_id",    limit: 4, null: false
  end

  add_index "timeline_has_media", ["media_id"], name: "media_id", using: :btree
  add_index "timeline_has_media", ["timeline_id"], name: "timeline_id", using: :btree

  create_table "txt_nation_network", primary_key: "txt_nation_network_id", force: :cascade do |t|
    t.string  "provider",                        limit: 9
    t.string  "network_name",                    limit: 40
    t.string  "country_code",                    limit: 2
    t.string  "shortcode",                       limit: 20
    t.string  "tariff",                          limit: 200
    t.float   "tariff_amount",                   limit: 24
    t.string  "tariff_info",                     limit: 200
    t.float   "credits",                         limit: 24
    t.string  "billing_type",                    limit: 2
    t.string  "keyword",                         limit: 20
    t.string  "user_spending_limit_monthly",     limit: 20
    t.string  "user_spending_limit_transaction", limit: 20
    t.string  "legalNotice",                     limit: 400
    t.integer "suquence",                        limit: 2,   default: 0,    null: false
    t.string  "updated",                         limit: 3,   default: "no", null: false
  end

  add_index "txt_nation_network", ["country_code"], name: "country_code", using: :btree
  add_index "txt_nation_network", ["network_name"], name: "network_name", using: :btree
  add_index "txt_nation_network", ["updated"], name: "updated", using: :btree

  create_table "txt_nation_sms", primary_key: "txt_nation_sms_id", force: :cascade do |t|
    t.string   "txt_nation_network_id",  limit: 20
    t.integer  "website_user_id",        limit: 4
    t.string   "sms_network_id",         limit: 20
    t.string   "sms_message_id",         limit: 255,                null: false
    t.string   "sms_billing_type",       limit: 2
    t.string   "sms_country_code",       limit: 2
    t.string   "sms_number",             limit: 255,                null: false
    t.string   "sms_shortcode",          limit: 20
    t.string   "sms_message",            limit: 500,                null: false
    t.datetime "sms_date",                                          null: false
    t.string   "response_message",       limit: 160
    t.float    "response_value",         limit: 24
    t.integer  "response_packet_number", limit: 2,   default: 0,    null: false
    t.integer  "response_minutes",       limit: 4,   default: 0,    null: false
    t.string   "response_code",          limit: 13
    t.datetime "response_date",                                     null: false
    t.string   "packet_session",         limit: 23
    t.string   "is_success",             limit: 3,   default: "no", null: false
    t.string   "is_process",             limit: 3,   default: "no", null: false
    t.string   "is_attached",            limit: 3,   default: "no", null: false
    t.string   "by_phone",               limit: 3,   default: "no", null: false
    t.string   "warning",                limit: 200
  end

  add_index "txt_nation_sms", ["is_success"], name: "is_success", using: :btree
  add_index "txt_nation_sms", ["packet_session"], name: "packet_session", using: :btree
  add_index "txt_nation_sms", ["response_code"], name: "response_code", using: :btree
  add_index "txt_nation_sms", ["response_date"], name: "response_date", using: :btree
  add_index "txt_nation_sms", ["txt_nation_network_id"], name: "fk_txt_nation_network", using: :btree
  add_index "txt_nation_sms", ["website_user_id"], name: "fk_website_user", using: :btree

  # create_table "upload", primary_key: "upload_id", force: :cascade do |t|
  #   t.integer  "upload_action_id",                     limit: 4,                                null: false
  #   t.integer  "file_object_type_id",                  limit: 4,                                null: false
  #   t.datetime "created",                                                                       null: false
  #   t.integer  "company_id",                           limit: 4,                                null: false
  #   t.integer  "user_id",                              limit: 4,                                null: false
  #   t.integer  "content_id",                           limit: 4
  #   t.integer  "secondary_content_id",                 limit: 4
  #   t.integer  "target_id",                            limit: 4
  #   t.string   "upload_subpath",                       limit: 20000,                            null: false
  #   t.datetime "upload_start"
  #   t.datetime "upload_finish"
  #   t.string   "status",                               limit: 50,    default: "Upload waiting"
  #   t.string   "upload_status",                        limit: 10,    default: "waiting",        null: false
  #   t.string   "encode_status",                        limit: 10,    default: "waiting",        null: false
  #   t.string   "processing_status",                    limit: 10,    default: "waiting",        null: false
  #   t.string   "options",                              limit: 100
  #   t.string   "json_options",                         limit: 255
  #   t.string   "encoder_message",                      limit: 200
  #   t.integer  "spent_time_id",                        limit: 4
  #   t.integer  "priority",                             limit: 4,     default: 0,                null: false
  #   t.integer  "warnings",                             limit: 4,     default: 0,                null: false
  #   t.string   "upload_mode",                          limit: 3,     default: "ftp",            null: false
  #   t.string   "rebuild_status_of_affected_resources", limit: 10,    default: "skipped"
  # end

  # add_index "upload", ["company_id"], name: "fk_upload_company", using: :btree
  # add_index "upload", ["content_id"], name: "fk_upload_content", using: :btree
  # add_index "upload", ["encode_status"], name: "encode_status", using: :btree
  # add_index "upload", ["file_object_type_id"], name: "fk_upload_file_object_type", using: :btree
  # add_index "upload", ["processing_status"], name: "processing_status", using: :btree
  # add_index "upload", ["secondary_content_id"], name: "secondary_content", using: :btree
  # add_index "upload", ["spent_time_id"], name: "fk_upload_spent_time1", using: :btree
  # add_index "upload", ["upload_action_id"], name: "fk_upload_upload_action", using: :btree
  # add_index "upload", ["upload_status", "encode_status", "rebuild_status_of_affected_resources"], name: "upload_status_2", using: :btree
  # add_index "upload", ["upload_status"], name: "upload_status", using: :btree
  # add_index "upload", ["user_id"], name: "fk_upload_user", using: :btree



  create_table "upload_item", primary_key: "upload_item_id", force: :cascade do |t|
    t.integer "upload_id",             limit: 4,    null: false
    t.string  "path",                  limit: 1000, null: false
    t.integer "order_index",           limit: 4,    null: false
    t.integer "encoding_id",           limit: 4
    t.integer "media_gallery_rate",    limit: 1
    t.integer "source_upload_item_id", limit: 4
    t.integer "destination_id",        limit: 4
  end

  add_index "upload_item", ["source_upload_item_id"], name: "fk_upload_item_upload_item1", using: :btree
  add_index "upload_item", ["upload_id"], name: "fk_upload_item_upload1", using: :btree

  create_table "upload_option", primary_key: "upload_option_id", force: :cascade do |t|
    t.string  "name",          limit: 30, null: false
    t.string  "constant",      limit: 45, null: false
    t.integer "media_type_id", limit: 4,  null: false
    t.string  "selected",      limit: 1,  null: false
  end

  create_table "upload_slot", primary_key: "upload_slot_id", force: :cascade do |t|
    t.integer "content_id",           limit: 4,             null: false
    t.integer "slot_order",           limit: 4, default: 1, null: false
    t.integer "secondary_content_id", limit: 4
    t.integer "file_object_type_id",  limit: 4,             null: false
  end

  add_index "upload_slot", ["content_id"], name: "fk_image_slot_content1", using: :btree
  add_index "upload_slot", ["file_object_type_id"], name: "fk_upload_slot_file_object_type1", using: :btree
  add_index "upload_slot", ["secondary_content_id"], name: "fk_image_slot_content2", using: :btree

  create_table "upload_slot_file", primary_key: "upload_slot_file_id", force: :cascade do |t|
    t.integer "upload_slot_id",  limit: 4,  null: false
    t.integer "upload_id",       limit: 4
    t.string  "storage_url",     limit: 45
    t.string  "image_path",      limit: 45
    t.string  "lighttp_options", limit: 45
  end

  add_index "upload_slot_file", ["upload_id"], name: "fk_upload_slot_file_upload1", using: :btree
  add_index "upload_slot_file", ["upload_slot_id"], name: "fk_image_slot_file_image_slot1", using: :btree

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

  create_table "user_action", primary_key: "user_action_id", force: :cascade do |t|
    t.string "constant",     limit: 45,    null: false
    t.text   "description",  limit: 65535
    t.string "target_table", limit: 45
  end

  create_table "user_action_log", primary_key: "user_action_log_id", force: :cascade do |t|
    t.integer  "user_id",        limit: 4,     null: false
    t.integer  "user_action_id", limit: 4,     null: false
    t.datetime "created",                      null: false
    t.text     "log",            limit: 65535
    t.integer  "target_id",      limit: 4
  end

  add_index "user_action_log", ["user_action_id"], name: "fk_user_action_log_user_action1", using: :btree
  add_index "user_action_log", ["user_id"], name: "fk_user_log_user1", using: :btree

  create_table "user_authentication_log", primary_key: "user_authentication_log_id", force: :cascade do |t|
    t.datetime "attempt_date",              null: false
    t.string   "login_entered", limit: 256, null: false
    t.string   "ip",            limit: 100, null: false
    t.string   "result",        limit: 7,   null: false
    t.integer  "user_id",       limit: 4
  end

  create_table "user_file", primary_key: "user_file_id", force: :cascade do |t|
    t.integer  "user_id",     limit: 4,   null: false
    t.integer  "website_id",  limit: 4,   null: false
    t.string   "filename",    limit: 100, null: false
    t.integer  "filesize",    limit: 4,   null: false
    t.datetime "created",                 null: false
    t.string   "description", limit: 255
  end

  add_index "user_file", ["user_id"], name: "fk_user_file_user1", using: :btree
  add_index "user_file", ["website_id"], name: "fk_user_file_website1", using: :btree

  create_table "user_has_ftp_directory", id: false, force: :cascade do |t|
    t.integer "user_id",              limit: 4,                 null: false
    t.integer "ftp_directory_id",     limit: 4,                 null: false
    t.string  "permission_to_rename", limit: 3, default: "yes", null: false
    t.string  "permission_to_remove", limit: 3, default: "yes", null: false
  end

  add_index "user_has_ftp_directory", ["ftp_directory_id"], name: "fk_link_website_user_ftp_directory_ftp_directory1", using: :btree
  add_index "user_has_ftp_directory", ["user_id"], name: "fk_link_website_user_ftp_directory_website_user1", using: :btree

  create_table "user_has_message", id: false, force: :cascade do |t|
    t.integer  "user_id",    limit: 4,                null: false
    t.integer  "message_id", limit: 4,                null: false
    t.datetime "read"
    t.string   "is_deleted", limit: 3, default: "no", null: false
    t.datetime "deleted"
  end

  add_index "user_has_message", ["is_deleted"], name: "is_deleted_index", using: :btree
  add_index "user_has_message", ["message_id"], name: "fk_user_has_message_message1", using: :btree
  add_index "user_has_message", ["user_id"], name: "fk_user_has_message_user1", using: :btree

  create_table "user_has_notification_event", id: false, force: :cascade do |t|
    t.integer "user_id",               limit: 4,                null: false
    t.integer "notification_event_id", limit: 4,                null: false
    t.string  "notify_by_email",       limit: 3, default: "no"
    t.string  "notify_by_message",     limit: 3, default: "no"
  end

  add_index "user_has_notification_event", ["notification_event_id"], name: "fk_user_has_notification_event_notification_event1", using: :btree
  add_index "user_has_notification_event", ["user_id"], name: "fk_user_has_notification_event_user1", using: :btree

  create_table "user_has_page_setting", id: false, force: :cascade do |t|
    t.integer "user_id",    limit: 4,                 null: false
    t.integer "page_id",    limit: 4,                 null: false
    t.integer "website_id", limit: 4,                 null: false
    t.string  "visible",    limit: 3, default: "yes", null: false
  end

  add_index "user_has_page_setting", ["page_id"], name: "fk_user_has_page_page1", using: :btree
  add_index "user_has_page_setting", ["user_id"], name: "fk_user_has_page_user1", using: :btree
  add_index "user_has_page_setting", ["website_id"], name: "fk_user_has_page_setting_website1", using: :btree

  create_table "user_has_permission_group", id: false, force: :cascade do |t|
    t.integer "user_id",             limit: 4, null: false
    t.integer "permission_group_id", limit: 4, null: false
  end

  add_index "user_has_permission_group", ["permission_group_id"], name: "fk_user_has_permission_group_permission_group1", using: :btree
  add_index "user_has_permission_group", ["user_id"], name: "fk_user_has_permission_group_user1", using: :btree

  create_table "user_schedule", primary_key: "user_schedule_id", force: :cascade do |t|
    t.integer  "user_id",     limit: 4,                         null: false
    t.datetime "created",                                       null: false
    t.text     "description", limit: 65535
    t.string   "state",       limit: 9,     default: "waiting", null: false
    t.datetime "done_date"
  end

  add_index "user_schedule", ["user_id"], name: "fk_user_schedule_user1", using: :btree


  create_table "video_encode_queue", primary_key: "video_encode_queue_id", force: :cascade do |t|
    t.integer  "video_id",          limit: 4, null: false
    t.integer  "video_encoding_id", limit: 4, null: false
    t.datetime "created",                     null: false
    t.datetime "started"
    t.integer  "video_encoded_id",  limit: 4
  end

  add_index "video_encode_queue", ["video_encoded_id"], name: "fk_video_encode_queue_video_encoded1", using: :btree
  add_index "video_encode_queue", ["video_encoding_id"], name: "fk_video_encode_queue_video_encoding1", using: :btree
  add_index "video_encode_queue", ["video_id"], name: "fk_video_encode_queue_video1", using: :btree

  create_table "video_encoded", primary_key: "video_encoded_id", force: :cascade do |t|
    t.integer  "video_id",          limit: 4,    null: false
    t.integer  "video_encoding_id", limit: 4,    null: false
    t.integer  "encoder_server_id", limit: 4,    null: false
    t.datetime "encode_start",                   null: false
    t.datetime "encode_finish",                  null: false
    t.string   "encode_status",     limit: 10,   null: false
    t.string   "encode_log",        limit: 1000, null: false
    t.integer  "video_file_id",     limit: 4
  end

  add_index "video_encoded", ["encoder_server_id"], name: "fk_video_encoded_encoder_server", using: :btree
  add_index "video_encoded", ["video_file_id"], name: "fk_video_encoded_video_file1", using: :btree
  add_index "video_encoded", ["video_id"], name: "fk_video_encoded_video", using: :btree





  create_table "video_link", primary_key: "video_link_id", force: :cascade do |t|
    t.string   "url",                  limit: 255,                           null: false
    t.string   "status",               limit: 11,    default: "downloading", null: false
    t.integer  "filesize",             limit: 8
    t.text     "log",                  limit: 65535
    t.datetime "created",                                                    null: false
    t.datetime "finished"
    t.datetime "downloaded"
    t.datetime "cut_started"
    t.datetime "cut_finished"
    t.datetime "vercury_started"
    t.datetime "vercury_finished"
    t.datetime "fingercheck_started"
    t.datetime "fingercheck_finished"
    t.string   "vercury_found",        limit: 3
    t.string   "fingerprint_found",    limit: 3
  end

  add_index "video_link", ["url"], name: "url_UNIQUE", unique: true, using: :btree

  create_table "video_mode", primary_key: "video_mode_id", force: :cascade do |t|
    t.string  "name",  limit: 45, null: false
    t.integer "level", limit: 2,  null: false
    t.string  "code",  limit: 10, null: false
  end

  add_index "video_mode", ["code"], name: "idx_code_unique", unique: true, using: :btree

  create_table "video_transcoding_matrix", id: false, force: :cascade do |t|
    t.integer "target_video_encoding_id", limit: 4, null: false
    t.integer "source_video_encoding_id", limit: 4, null: false
    t.integer "priority",                 limit: 2, null: false
    t.integer "estimate_minutes",         limit: 2
  end

  add_index "video_transcoding_matrix", ["source_video_encoding_id"], name: "fk_video_transcoding_matrix_video_encoding2", using: :btree
  add_index "video_transcoding_matrix", ["target_video_encoding_id"], name: "fk_video_transcoding_matrix_video_encoding1", using: :btree

  create_table "vob", force: :cascade do |t|
    t.text     "path",             limit: 65535,                 null: false
    t.string   "path_hash",        limit: 32,                    null: false
    t.boolean  "is_added",         limit: 1,     default: false, null: false
    t.integer  "longest_title_id", limit: 4
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.boolean  "is_splitted",      limit: 1,     default: false, null: false
    t.integer  "line_id",          limit: 4
    t.integer  "company_id",       limit: 4
  end

  add_index "vob", ["path_hash"], name: "path_hash_UNIQUE", unique: true, using: :btree

  create_table "vob_chapter", force: :cascade do |t|
    t.integer  "vob_id",               limit: 4,                     null: false
    t.integer  "chapter_id",           limit: 4,                     null: false
    t.integer  "title_id",             limit: 4,                     null: false
    t.text     "path",                 limit: 65535
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at"
    t.boolean  "is_converted",         limit: 1,     default: false, null: false
    t.integer  "upload_id",            limit: 4
    t.integer  "scene_id",             limit: 4
    t.integer  "is_released",          limit: 1,     default: 0,     null: false
    t.integer  "content_id",           limit: 4
    t.integer  "web_added",            limit: 1,     default: 0
    t.integer  "is_casting_generated", limit: 1,     default: 0
  end

  add_index "vob_chapter", ["content_id"], name: "fk_vob_chapter_content", using: :btree
  add_index "vob_chapter", ["scene_id"], name: "fk_vob_chapter_scene", using: :btree
  add_index "vob_chapter", ["upload_id"], name: "fk_vob_chapter_upload", using: :btree
  add_index "vob_chapter", ["vob_id"], name: "fk_vob_chapter_1_idx", using: :btree

  create_table "vw_content_model", id: false, force: :cascade do |t|
    t.integer "content_id",        limit: 4
    t.integer "model_id",          limit: 4,  default: 0, null: false
    t.string  "hair_color",        limit: 6
    t.string  "hair_length",       limit: 6
    t.string  "height",            limit: 3
    t.string  "weight",            limit: 2
    t.string  "skin_color",        limit: 5
    t.string  "race",              limit: 8
    t.integer "age",               limit: 4
    t.string  "stage_name",        limit: 30,             null: false
    t.string  "image_subpath",     limit: 20
    t.string  "image_url",         limit: 45
    t.string  "image_filename",    limit: 50
    t.integer "image_encoding_id", limit: 4
  end

  create_table "vw_content_model_gallery_thumbnail", id: false, force: :cascade do |t|
    t.integer "model_id",          limit: 4,              null: false
    t.integer "scene_content_id",  limit: 4,              null: false
    t.integer "image_id",          limit: 4,  default: 0, null: false
    t.string  "image_subpath",     limit: 20,             null: false
    t.string  "image_url",         limit: 45,             null: false
    t.string  "image_filename",    limit: 50,             null: false
    t.integer "image_encoding_id", limit: 4,              null: false
    t.integer "image_media_id",    limit: 4,              null: false
  end

  create_table "vw_content_model_thumbnail", id: false, force: :cascade do |t|
    t.integer "model_id",          limit: 4,  default: 0, null: false
    t.string  "stage_name",        limit: 30,             null: false
    t.string  "image_subpath",     limit: 20,             null: false
    t.string  "image_url",         limit: 45,             null: false
    t.string  "image_filename",    limit: 50,             null: false
    t.integer "image_encoding_id", limit: 4,              null: false
  end

  create_table "vw_content_scene", id: false, force: :cascade do |t|
    t.integer "scene_content_id", limit: 4,               null: false
    t.string  "scene_name",       limit: 128,             null: false
    t.integer "scene_number",     limit: 4,               null: false
    t.integer "movie_content_id", limit: 4,               null: false
    t.string  "movie_name",       limit: 128,             null: false
    t.integer "movie_id",         limit: 4,   default: 0, null: false
  end

  create_table "vw_content_video", id: false, force: :cascade do |t|
    t.integer  "media_id",              limit: 4,   default: 0,   null: false
    t.integer  "total_views",           limit: 4,   default: 0,   null: false
    t.integer  "total_comments",        limit: 8,   default: 0,   null: false
    t.integer  "content_id",            limit: 4
    t.datetime "created",                                         null: false
    t.string   "video_subpath",         limit: 20,  default: "",  null: false
    t.string   "video_url",             limit: 45,  default: "",  null: false
    t.string   "video_filename",        limit: 25,  default: "",  null: false
    t.float    "duration",              limit: 24,  default: 0.0, null: false
    t.integer  "video_encoding_id",     limit: 4,   default: 0,   null: false
    t.string   "file_type_family_name", limit: 30,  default: "",  null: false
    t.string   "video_storage_url",     limit: 45,  default: "",  null: false
    t.string   "author_name",           limit: 50,  default: "",  null: false
    t.string   "content_title",         limit: 275
    t.string   "content_description",   limit: 400
    t.integer  "video_id",              limit: 4,   default: 0,   null: false
    t.string   "video_encoding_name",   limit: 30,  default: "",  null: false
  end

  create_table "vw_content_video_thumbnail", id: false, force: :cascade do |t|
    t.integer  "media_id",                  limit: 4,   default: 0, null: false
    t.integer  "hot",                       limit: 4
    t.integer  "seeding",                   limit: 4
    t.integer  "vote_sum",                  limit: 4
    t.integer  "vote_total",                limit: 4
    t.integer  "views",                     limit: 4
    t.integer  "downloads",                 limit: 4
    t.integer  "content_id",                limit: 4
    t.datetime "video_created"
    t.string   "file_object_type_constant", limit: 45
    t.integer  "content_family_id",         limit: 4
    t.string   "content_family_sef_name",   limit: 255
    t.string   "file_type_family_name",     limit: 30
    t.integer  "hd",                        limit: 4
    t.float    "duration",                  limit: 24
    t.float    "full_video_duration",       limit: 24
    t.integer  "filesize",                  limit: 4
    t.string   "image_path",                limit: 200
    t.string   "image_url",                 limit: 200
    t.string   "main_thumbnail_image",      limit: 255
    t.string   "playshot_image",            limit: 255
    t.string   "thumbnails_set",            limit: 255
    t.string   "timeline_image",            limit: 255
    t.string   "content_title",             limit: 275
    t.integer  "director_id",               limit: 8,   default: 0, null: false
    t.string   "director_sef_name",         limit: 255
    t.time     "runtime"
    t.string   "scene_genre_list",          limit: 341
    t.string   "scene_genre_sef_name_list", limit: 341
    t.string   "model_list",                limit: 341
    t.string   "model_sef_name_list",       limit: 341
    t.integer  "label_id",                  limit: 8
    t.string   "label_name",                limit: 45
    t.string   "content_type",              limit: 20
    t.string   "content_sef_name",          limit: 255
    t.integer  "line_id",                   limit: 8
  end

  create_table "vw_genre_swf_banner", id: false, force: :cascade do |t|
    t.integer  "pk_id",         limit: 4,   default: 0,  null: false
    t.integer  "image_id",      limit: 4,   default: 0,  null: false
    t.integer  "image_file_id", limit: 4,   default: 0,  null: false
    t.datetime "created",                                null: false
    t.integer  "filesize",      limit: 4,   default: 0,  null: false
    t.integer  "width",         limit: 4,   default: 0,  null: false
    t.integer  "height",        limit: 4,   default: 0,  null: false
    t.string   "url",           limit: 190
    t.string   "name",          limit: 45,  default: "", null: false
    t.string   "storage_url",   limit: 45,  default: "", null: false
    t.string   "subpath",       limit: 20,  default: "", null: false
    t.string   "filename",      limit: 50,  default: "", null: false
    t.string   "orig_filename", limit: 50,  default: "", null: false
    t.string   "layout",        limit: 10,  default: "", null: false
    t.integer  "website_id",    limit: 4,   default: 0,  null: false
    t.string   "shortname",     limit: 45
  end

  create_table "vw_image_small_thumbnail", id: false, force: :cascade do |t|
    t.string  "image_path",          limit: 84
    t.integer "image_id",            limit: 4,  default: 0, null: false
    t.string  "image_url",           limit: 45,             null: false
    t.integer "image_media_id",      limit: 4,              null: false
    t.integer "source_media_id",     limit: 4
    t.string  "image_type_constant", limit: 45,             null: false
  end

  create_table "vw_media_video", id: false, force: :cascade do |t|
    t.integer  "media_id",              limit: 4,  default: 0, null: false
    t.integer  "total_views",           limit: 4,              null: false
    t.integer  "total_comments",        limit: 8,  default: 0, null: false
    t.integer  "content_id",            limit: 4
    t.datetime "created",                                      null: false
    t.string   "video_subpath",         limit: 20,             null: false
    t.string   "video_url",             limit: 45,             null: false
    t.string   "video_filename",        limit: 25,             null: false
    t.float    "duration",              limit: 24,             null: false
    t.integer  "video_encoding_id",     limit: 4,              null: false
    t.string   "file_type_family_name", limit: 30,             null: false
    t.string   "video_storage_url",     limit: 45,             null: false
    t.string   "author_name",           limit: 50,             null: false
    t.integer  "video_id",              limit: 4,  default: 0, null: false
    t.string   "video_encoding_name",   limit: 30,             null: false
  end

  create_table "vw_media_video_thumbnail", id: false, force: :cascade do |t|
    t.integer  "media_id",                  limit: 4,                 null: false
    t.integer  "hot",                       limit: 4
    t.integer  "seeding",                   limit: 4
    t.integer  "vote_sum",                  limit: 4
    t.integer  "vote_total",                limit: 4
    t.integer  "views",                     limit: 4
    t.integer  "downloads",                 limit: 4
    t.integer  "content_id",                limit: 4
    t.datetime "video_created"
    t.string   "file_object_type_constant", limit: 45
    t.integer  "content_family_id",         limit: 4
    t.string   "content_family_sef_name",   limit: 255
    t.string   "file_type_family_name",     limit: 30
    t.integer  "hd",                        limit: 4,     default: 0
    t.integer  "filesize",                  limit: 4
    t.float    "duration",                  limit: 24
    t.float    "full_video_duration",       limit: 24
    t.string   "image_path",                limit: 200
    t.string   "image_url",                 limit: 200
    t.time     "runtime"
    t.string   "content_type",              limit: 20
    t.string   "content_sef_name",          limit: 255
    t.string   "main_thumbnail_image",      limit: 255
    t.string   "playshot_image",            limit: 255
    t.string   "thumbnails_set",            limit: 255
    t.string   "timeline_image",            limit: 255
    t.text     "timeline_json",             limit: 65535
  end

  create_table "vw_model_scene", id: false, force: :cascade do |t|
    t.integer  "scene_content_id",         limit: 4,               null: false
    t.integer  "scene_id",                 limit: 4,   default: 0, null: false
    t.integer  "model_id",                 limit: 4,               null: false
    t.integer  "scene_number",             limit: 4,               null: false
    t.string   "scene_genres",             limit: 341
    t.integer  "scene_count_video",        limit: 8
    t.integer  "scene_count_model",        limit: 8
    t.integer  "scene_count_gallery",      limit: 8
    t.float    "scene_duration",           limit: 53
    t.integer  "movie_id",                 limit: 4,   default: 0, null: false
    t.string   "movie_name",               limit: 128,             null: false
    t.time     "movie_runtime",                                    null: false
    t.datetime "movie_first_release_date"
    t.string   "movie_first_release_url",  limit: 70
  end

  create_table "vw_model_scene_images", id: false, force: :cascade do |t|
    t.integer "scene_content_id",        limit: 4,   null: false
    t.string  "scene_name",              limit: 128, null: false
    t.string  "movie_name",              limit: 128, null: false
    t.string  "image_subpath",           limit: 20,  null: false
    t.string  "image_url",               limit: 45,  null: false
    t.string  "image_filename",          limit: 50,  null: false
    t.integer "image_encoding_id",       limit: 4,   null: false
    t.string  "image_path",              limit: 96
    t.string  "image_encoding_constant", limit: 45,  null: false
  end

  create_table "vw_model_scene_images_thumbnail", id: false, force: :cascade do |t|
    t.integer "content_id",        limit: 4
    t.string  "image_url",         limit: 45,             null: false
    t.string  "image_subpath",     limit: 20,             null: false
    t.integer "media_id",          limit: 4,              null: false
    t.integer "image_file_id",     limit: 4,  default: 0, null: false
    t.string  "image_filename",    limit: 50,             null: false
    t.integer "image_encoding_id", limit: 4,              null: false
    t.string  "image_path",        limit: 96
    t.integer "image_id",          limit: 4,  default: 0, null: false
  end

  create_table "vw_model_scene_images_xga", id: false, force: :cascade do |t|
    t.integer "content_id",        limit: 4
    t.string  "image_url",         limit: 45,             null: false
    t.string  "image_subpath",     limit: 20,             null: false
    t.integer "image_file_id",     limit: 4,  default: 0, null: false
    t.string  "image_filename",    limit: 50,             null: false
    t.integer "image_encoding_id", limit: 4,              null: false
    t.string  "image_path",        limit: 96
    t.integer "image_id",          limit: 4,  default: 0, null: false
  end

  create_table "vw_more_video_all", id: false, force: :cascade do |t|
    t.integer "media_id",      limit: 4,   default: 0,   null: false
    t.float   "duration",      limit: 24,  default: 0.0, null: false
    t.string  "content_title", limit: 275
  end

  create_table "vw_more_video_base", id: false, force: :cascade do |t|
    t.integer "movie_id",              limit: 4,   default: 0, null: false
    t.string  "movie_name",            limit: 128,             null: false
    t.integer "scene_number",          limit: 4,               null: false
    t.integer "scene_id",              limit: 4,   default: 0, null: false
    t.integer "scene_director_id",     limit: 4,               null: false
    t.integer "scene_line_id",         limit: 4,               null: false
    t.integer "media_id",              limit: 4,               null: false
    t.float   "duration",              limit: 24,              null: false
    t.integer "video_encoding_id",     limit: 4,               null: false
    t.string  "file_type_family_name", limit: 30,              null: false
    t.string  "video_storage_url",     limit: 45,              null: false
    t.string  "media_title",           limit: 127
    t.string  "content_title",         limit: 275
  end

  create_table "vw_more_video_director", id: false, force: :cascade do |t|
    t.integer "media_id",      limit: 4,               null: false
    t.float   "duration",      limit: 24,              null: false
    t.string  "content_title", limit: 159
    t.integer "director_id",   limit: 4,   default: 0, null: false
  end

  create_table "vw_more_video_label", id: false, force: :cascade do |t|
    t.integer "media_id",      limit: 4,               null: false
    t.float   "duration",      limit: 24,              null: false
    t.string  "content_title", limit: 174
    t.integer "label_id",      limit: 4,   default: 0, null: false
  end

  create_table "vw_more_video_model", id: false, force: :cascade do |t|
    t.integer "media_id",      limit: 4,   null: false
    t.float   "duration",      limit: 24,  null: false
    t.string  "content_title", limit: 159
    t.integer "model_id",      limit: 4,   null: false
  end

  create_table "vw_more_video_movie", id: false, force: :cascade do |t|
    t.integer "media_id",      limit: 4,               null: false
    t.float   "duration",      limit: 24,              null: false
    t.string  "content_title", limit: 275
    t.integer "movie_id",      limit: 4,   default: 0, null: false
  end

  create_table "vw_more_video_scene", id: false, force: :cascade do |t|
    t.integer "media_id",      limit: 4,               null: false
    t.float   "duration",      limit: 24,              null: false
    t.string  "content_title", limit: 275
    t.integer "scene_id",      limit: 4,   default: 0, null: false
  end

  create_table "vw_more_video_website", id: false, force: :cascade do |t|
    t.integer "media_id",      limit: 4,   null: false
    t.float   "duration",      limit: 24,  null: false
    t.string  "content_title", limit: 170
  end

  create_table "vw_movie_playlist_free_video", id: false, force: :cascade do |t|
    t.integer "content_id",        limit: 4
    t.integer "media_id",          limit: 4,   default: 0,   null: false
    t.string  "video_storage_url", limit: 45,  default: "",  null: false
    t.integer "video_encoding_id", limit: 4,   default: 0,   null: false
    t.float   "duration",          limit: 24,  default: 0.0, null: false
    t.integer "scene_number",      limit: 4,   default: 0,   null: false
    t.string  "content_title",     limit: 275
    t.string  "image_path",        limit: 84
    t.string  "image_url",         limit: 45
  end

  create_table "vw_movie_playlist_released_video", id: false, force: :cascade do |t|
    t.integer "content_id",        limit: 4,   null: false
    t.string  "video_storage_url", limit: 45,  null: false
    t.integer "media_id",          limit: 4,   null: false
    t.integer "video_encoding_id", limit: 4,   null: false
    t.float   "duration",          limit: 24,  null: false
    t.integer "scene_number",      limit: 4,   null: false
    t.string  "title",             limit: 275
    t.string  "image_path",        limit: 84
    t.string  "image_url",         limit: 45
  end

  create_table "vw_scene_filter", id: false, force: :cascade do |t|
    t.integer "scene_id",      limit: 4,    default: 0,     null: false
    t.integer "website_id",    limit: 4,                    null: false
    t.integer "age",           limit: 4
    t.integer "views",         limit: 4,                    null: false
    t.integer "rate",          limit: 8,    default: 0,     null: false
    t.integer "downloads",     limit: 4,                    null: false
    t.float   "price",         limit: 53,   default: 0.0,   null: false
    t.string  "scene_name",    limit: 128,  default: "",    null: false
    t.string  "description",   limit: 200,  default: "",    null: false
    t.string  "thumbnail_url", limit: 255
    t.integer "vote_total",    limit: 8,    default: 0,     null: false
    t.string  "models",        limit: 1024
    t.string  "ratio",         limit: 4,    default: "4:3"
  end

  create_table "vw_sinesite_video_clip_free", id: false, force: :cascade do |t|
    t.integer "media_id",                limit: 4,  null: false
    t.integer "video_encoding_id",       limit: 4,  null: false
    t.string  "video_storage_url",       limit: 45, null: false
    t.integer "content_id",              limit: 4
    t.string  "video_encoding_constant", limit: 45, null: false
  end

  create_table "vw_sinesite_video_clip_pay", id: false, force: :cascade do |t|
    t.integer "media_id",                limit: 4,  null: false
    t.integer "video_encoding_id",       limit: 4,  null: false
    t.string  "video_storage_url",       limit: 45, null: false
    t.integer "content_id",              limit: 4
    t.string  "video_encoding_constant", limit: 45, null: false
  end

  create_table "vw_sinesite_video_popup", id: false, force: :cascade do |t|
    t.float   "duration",          limit: 24,              null: false
    t.integer "media_id",          limit: 4,               null: false
    t.integer "video_encoding_id", limit: 4,               null: false
    t.string  "storage_url",       limit: 45,              null: false
    t.integer "scene_id",          limit: 4,   default: 0, null: false
    t.string  "content_title",     limit: 275
  end

  create_table "vw_tgp_image", id: false, force: :cascade do |t|
    t.string  "image_path",              limit: 84
    t.integer "image_id",                limit: 4,  default: 0, null: false
    t.string  "image_url",               limit: 45,             null: false
    t.integer "image_media_id",          limit: 4,              null: false
    t.integer "source_media_id",         limit: 4
    t.string  "image_type_constant",     limit: 45,             null: false
    t.string  "image_encoding_constant", limit: 45,             null: false
  end

  create_table "vw_tgp_image_banner", id: false, force: :cascade do |t|
    t.string  "image_path",              limit: 84
    t.integer "image_id",                limit: 4,  default: 0, null: false
    t.string  "image_url",               limit: 45,             null: false
    t.integer "image_media_id",          limit: 4,              null: false
    t.integer "source_media_id",         limit: 4
    t.string  "image_type_constant",     limit: 45,             null: false
    t.string  "image_encoding_constant", limit: 45,             null: false
  end

  create_table "vw_tgp_image_thumbnail", id: false, force: :cascade do |t|
    t.string  "image_path",              limit: 84
    t.integer "image_id",                limit: 4,  default: 0, null: false
    t.string  "image_url",               limit: 45,             null: false
    t.integer "image_media_id",          limit: 4,              null: false
    t.integer "source_media_id",         limit: 4
    t.string  "image_type_constant",     limit: 45,             null: false
    t.string  "image_encoding_constant", limit: 45,             null: false
  end

  create_table "vw_tgp_image_xga", id: false, force: :cascade do |t|
    t.string  "image_path",              limit: 84
    t.integer "image_id",                limit: 4,  default: 0, null: false
    t.string  "image_url",               limit: 45,             null: false
    t.integer "image_media_id",          limit: 4,              null: false
    t.integer "source_media_id",         limit: 4
    t.string  "image_type_constant",     limit: 45,             null: false
    t.string  "image_encoding_constant", limit: 45,             null: false
  end

  create_table "vw_tgp_video", id: false, force: :cascade do |t|
    t.integer "video_id",             limit: 4,  default: 0, null: false
    t.string  "video_storage_url",    limit: 45,             null: false
    t.integer "media_id",             limit: 4,              null: false
    t.integer "video_encoding_id",    limit: 4,              null: false
    t.float   "duration",             limit: 24,             null: false
    t.string  "video_path",           limit: 59
    t.string  "file_family_constant", limit: 45,             null: false
  end

  create_table "vw_tgp_video_free", id: false, force: :cascade do |t|
    t.string  "is_pay_video",         limit: 2,  default: "", null: false
    t.integer "video_id",             limit: 4,  default: 0,  null: false
    t.string  "video_storage_url",    limit: 45,              null: false
    t.integer "media_id",             limit: 4,               null: false
    t.integer "video_encoding_id",    limit: 4,               null: false
    t.string  "video_path",           limit: 59
    t.string  "file_family_constant", limit: 45,              null: false
  end

  create_table "vw_tgp_video_pay", id: false, force: :cascade do |t|
    t.string  "is_pay_video",         limit: 3,  default: "", null: false
    t.integer "video_id",             limit: 4,  default: 0,  null: false
    t.string  "video_storage_url",    limit: 45,              null: false
    t.integer "media_id",             limit: 4,               null: false
    t.integer "video_encoding_id",    limit: 4,               null: false
    t.string  "video_path",           limit: 59
    t.string  "file_family_constant", limit: 45,              null: false
  end

  create_table "vw_tgp_video_popup", id: false, force: :cascade do |t|
    t.integer "media_id", limit: 4,  null: false
    t.float   "duration", limit: 24, null: false
  end

  create_table "vw_video_resolutions", id: false, force: :cascade do |t|
    t.integer "media_id",          limit: 4,  null: false
    t.integer "video_encoding_id", limit: 4,  null: false
    t.string  "resolution",        limit: 5
    t.string  "codec",             limit: 9
    t.string  "video_storage_url", limit: 45, null: false
  end

  create_table "vw_website_banner", id: false, force: :cascade do |t|
    t.integer  "pk_id",             limit: 4,   default: 0,  null: false
    t.integer  "image_id",          limit: 4,   default: 0,  null: false
    t.integer  "image_file_id",     limit: 4,   default: 0,  null: false
    t.integer  "image_encoding_id", limit: 4,   default: 0,  null: false
    t.datetime "created",                                    null: false
    t.integer  "orig_filesize",     limit: 4,   default: 0,  null: false
    t.integer  "filesize",          limit: 4,   default: 0,  null: false
    t.integer  "orig_width",        limit: 4,   default: 0,  null: false
    t.integer  "width",             limit: 4,   default: 0,  null: false
    t.integer  "orig_height",       limit: 4,   default: 0,  null: false
    t.integer  "height",            limit: 4,   default: 0,  null: false
    t.integer  "website_id",        limit: 4,   default: 0,  null: false
    t.string   "url",               limit: 135
    t.string   "shortname",         limit: 45
    t.string   "name",              limit: 30,  default: "", null: false
    t.string   "storage_url",       limit: 45,  default: "", null: false
    t.string   "subpath",           limit: 20,  default: "", null: false
    t.string   "filename",          limit: 50,  default: "", null: false
    t.string   "orig_filename",     limit: 50,  default: "", null: false
    t.string   "layout",            limit: 10,  default: "", null: false
  end

  create_table "watermark", primary_key: "watermark_id", force: :cascade do |t|
    t.datetime "created",                    null: false
    t.string   "code",            limit: 16, null: false
    t.integer  "website_user_id", limit: 4,  null: false
  end

  add_index "watermark", ["code"], name: "unique_watermark", unique: true, using: :btree
  add_index "watermark", ["website_user_id"], name: "fk_watermark_website_user1", using: :btree

  create_table "website_has_content", id: false, force: :cascade do |t|
    t.string  "website_constant", limit: 45, null: false
    t.integer "content_id",       limit: 4,  null: false
  end

  add_index "website_has_content", ["content_id"], name: "fk_content_id", using: :btree
  add_index "website_has_content", ["website_constant"], name: "website_id_UNIQUE", unique: true, using: :btree

  create_table "website_user_content_permission_group", primary_key: "website_user_content_permission_group_id", force: :cascade do |t|
    t.string  "name",             limit: 50,                 null: false
    t.boolean "can_moderate",     limit: 1,                  null: false
    t.boolean "has_subforum",     limit: 1,                  null: false
    t.boolean "can_attach_media", limit: 1,  default: false
  end

  create_table "website_user_feed_dose", primary_key: "website_user_feed_dose_id", force: :cascade do |t|
    t.integer  "website_user_feed_subscription_id", limit: 4, null: false
    t.datetime "sent",                                        null: false
    t.integer  "series",                            limit: 4
    t.datetime "shown"
    t.datetime "reacted"
  end

  add_index "website_user_feed_dose", ["website_user_feed_subscription_id"], name: "fk_website_user_feed_subscription_has_feed_dose_website_user_1", using: :btree

  create_table "website_user_feed_dose_has_content", primary_key: "website_user_feed_dose_has_content_id", force: :cascade do |t|
    t.integer  "website_user_feed_dose_id", limit: 4, null: false
    t.integer  "content_id",                limit: 4, null: false
    t.datetime "reacted"
  end

  add_index "website_user_feed_dose_has_content", ["content_id"], name: "fk_website_user_feed_dose_has_content_content1", using: :btree
  add_index "website_user_feed_dose_has_content", ["website_user_feed_dose_id"], name: "fk_website_user_feed_dose_has_content_website_user_feed_dose1", using: :btree

  create_table "website_user_feed_subscription", primary_key: "website_user_feed_subscription_id", force: :cascade do |t|
    t.integer  "website_user_id",   limit: 4,                    null: false
    t.integer  "feed_id",           limit: 4,                    null: false
    t.string   "is_subscribed",     limit: 3,   default: "yes",  null: false
    t.string   "creation_type",     limit: 6,   default: "auto", null: false
    t.string   "subscription_type", limit: 4,   default: "mail", null: false
    t.integer  "period",            limit: 4
    t.datetime "last_dose_date"
    t.string   "custom_email",      limit: 100
    t.datetime "next_dose_date"
  end

  add_index "website_user_feed_subscription", ["feed_id"], name: "fk_website_user_has_feed_feed1", using: :btree
  add_index "website_user_feed_subscription", ["website_user_id"], name: "fk_website_user_has_feed_website_user1", using: :btree

  create_table "website_user_keeper", primary_key: "website_user_keeper_id", force: :cascade do |t|
    t.integer "website_user_id",  limit: 4,  null: false
    t.integer "website_id",       limit: 4,  null: false
    t.string  "current_pwd_hash", limit: 45
  end

  add_index "website_user_keeper", ["website_id"], name: "fk_website_user_keeper_website1", using: :btree
  add_index "website_user_keeper", ["website_user_id"], name: "fk_website_user_keeper_website_user1", using: :btree

  add_foreign_key "access_list", "ip_group", primary_key: "ip_group_id", name: "fk_access_list_ip_group1"
  add_foreign_key "agent", "company", primary_key: "company_id", name: "fk_agent_company"
  add_foreign_key "audio", "company", primary_key: "company_id", name: "fk_audio_company"
  add_foreign_key "audio", "content", column: "secondary_content_id", primary_key: "content_id", name: "fk_audio_content1"
  add_foreign_key "audio", "content", primary_key: "content_id", name: "fk_audio_content"
  add_foreign_key "audio", "file_object_type", primary_key: "file_object_type_id", name: "fk_audio_file_object_type"
  add_foreign_key "audio", "storage", primary_key: "storage_id", name: "fk_audio_storage"
  add_foreign_key "audio", "upload", primary_key: "upload_id", name: "fk_audio_upload"
  add_foreign_key "audio", "user", primary_key: "user_id", name: "fk_audio_user"
  add_foreign_key "audio_encoded", "audio", primary_key: "audio_id", name: "fk_audio_encoded_audio"
  add_foreign_key "audio_encoded", "encoder_server", primary_key: "encoder_server_id", name: "fk_audio_encoded_encoder_server"
  add_foreign_key "audio_encoding", "upload_extension", primary_key: "upload_extension_id", name: "fk_audio_encoding_upload_extension"
  add_foreign_key "audio_file", "audio", primary_key: "audio_id", name: "fk_audio_file_audio"
  add_foreign_key "audio_file", "media", column: "media_id", primary_key: "media_id", name: "fk_audio_file_media"
  add_foreign_key "barcode", "company", primary_key: "company_id", name: "fk_barcode_company"
  add_foreign_key "comment_vote", "comment", primary_key: "comment_id", name: "fk_comment_vote_comment"
  add_foreign_key "content", "content_type", primary_key: "content_type_id", name: "fk_content_content_type"
  add_foreign_key "content_has_image", "content", primary_key: "content_id", name: "fk_content_has_image_content1"
  add_foreign_key "content_has_image", "image", primary_key: "image_id", name: "fk_content_has_image_image1", on_delete: :cascade
  add_foreign_key "content_has_keyword", "content", primary_key: "content_id", name: "fk_content_has_keyword_content1"
  add_foreign_key "content_has_keyword", "keyword", primary_key: "keyword_id", name: "fk_content_has_keyword_keyword1"
  add_foreign_key "content_has_page", "content", primary_key: "content_id", name: "fk_content_has_page_content1"
  add_foreign_key "content_has_page", "page", primary_key: "page_id", name: "fk_content_has_page_page1", on_delete: :cascade
  add_foreign_key "content_has_video", "content", primary_key: "content_id", name: "fk_content_has_video_content1"
  add_foreign_key "content_has_video", "video", primary_key: "video_id", name: "fk_content_has_video_video1", on_delete: :cascade
  add_foreign_key "content_popularity_stat", "content", primary_key: "content_id", name: "content_popularity_stat_ibfk_1"
  add_foreign_key "content_popularity_stat", "scene", primary_key: "scene_id", name: "content_popularity_stat_ibfk_2"
  add_foreign_key "content_price_rate", "content", primary_key: "content_id", name: "content_price_rate_ibfk_1"
  add_foreign_key "content_price_rate_old", "content", primary_key: "content_id", name: "fk_content_price_rate_content1"
  add_foreign_key "content_relation", "content", column: "master_content_id", primary_key: "content_id", name: "content_relation_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "content_relation", "content", column: "slave_content_id", primary_key: "content_id", name: "content_relation_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "content_release", "content", primary_key: "content_id", name: "fk_content_release_content"
  add_foreign_key "content_release", "website", primary_key: "website_id", name: "content_release_ibfk_1"
  add_foreign_key "content_release_rating", "content_release", primary_key: "content_release_id", name: "fk_content_release_rating_content_release1", on_delete: :cascade
  add_foreign_key "content_restriction", "content", primary_key: "content_id", name: "fk_content_content_id", on_delete: :cascade
  add_foreign_key "content_subscription", "content", primary_key: "content_id", name: "fk_content_subscription_content1"
  add_foreign_key "content_subscription_news", "content_subscription", primary_key: "content_subscription_id", name: "fk_content_subscription_news_content_subscription1"
  add_foreign_key "content_subscription_news", "media", column: "media_id", primary_key: "media_id", name: "fk_content_subscription_news_media1"
  add_foreign_key "content_type_has_file_object_type", "content_type", primary_key: "content_type_id", name: "fk_content_type_has_file_object_type_content_type1"
  add_foreign_key "content_type_has_file_object_type", "file_object_type", primary_key: "file_object_type_id", name: "fk_content_type_has_file_object_type_file_object_type1"
  add_foreign_key "cue", "media", column: "illustration_media_id", primary_key: "media_id", name: "fk_cue_media2"
  add_foreign_key "cue", "media", column: "parent_video_media_id", primary_key: "media_id", name: "fk_cue_media1"
  add_foreign_key "custom_dvd_content", "content", primary_key: "content_id", name: "fk_custom_dvd_content_content1"
  add_foreign_key "custom_dvd_content", "custom_dvd", primary_key: "custom_dvd_id", name: "fk_custom_dvd_content_custom_dvd1"
  add_foreign_key "director", "company", primary_key: "company_id", name: "fk_director_company"
  add_foreign_key "director", "content", primary_key: "content_id", name: "fk_director_content"
  add_foreign_key "dvd", "content", primary_key: "content_id", name: "fk_dvd_content1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "dvd", "custom_dvd", primary_key: "custom_dvd_id", name: "fk_dvd_custom_dvd1"
  add_foreign_key "dvd", "dvd_template", primary_key: "dvd_template_id", name: "fk_dvd_dvd_template1"
  add_foreign_key "dvd", "movie", primary_key: "movie_id", name: "fk_dvd_movie1"
  add_foreign_key "dvd_client_log", "dvd", primary_key: "dvd_id", name: "fk_dvd_client_log_dvd1"
  add_foreign_key "dvd_part", "dvd", primary_key: "dvd_id", name: "dvd_part_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "dvd_userkey", "watermark", primary_key: "watermark_id", name: "fk_dvd_userkey_watermark1"
  add_foreign_key "dvd_userkey_part", "dvd_userkey", primary_key: "dvd_userkey_id", name: "fk_dvd_userkey_part_dvd_userkey1", on_delete: :cascade
  add_foreign_key "encode_job", "encoder_server", primary_key: "encoder_server_id", name: "fk_encode_job_encoder_server1"
  add_foreign_key "encode_job", "encoder_task", primary_key: "encoder_task_id", name: "fk_encode_job_encoder_task"
  add_foreign_key "encode_job", "upload", primary_key: "upload_id", name: "fk_encode_job_upload"
  add_foreign_key "feeding_log", "feed", primary_key: "feed_id", name: "fk_feeding_log_feed1"
  add_foreign_key "file_object_type", "content_type", primary_key: "content_type_id", name: "fk_file_object_type_content_type"
  add_foreign_key "file_object_type", "file_object_type_family", primary_key: "file_object_type_family_id", name: "fk_file_object_type_file_object_type_family1"
  add_foreign_key "fresh", "fresh_cathegory", primary_key: "fresh_cathegory_id", name: "fk_fresh_fresh_cathegory"
  add_foreign_key "fresh", "fresh_icon", primary_key: "fresh_icon_id", name: "fk_fresh_fresh_icon"
  add_foreign_key "fresh_link_media", "fresh", primary_key: "fresh_id", name: "fk_fresh_link_media_fresh"
  add_foreign_key "fresh_link_media", "media", column: "fresh_link_media_id", primary_key: "media_id", name: "fk_fresh_link_media_media"
  add_foreign_key "fresh_link_thread", "fresh", primary_key: "fresh_id", name: "fk_fresh_link_thread_fresh"
  add_foreign_key "gallery", "company", primary_key: "company_id", name: "fk_gallery_company1"
  add_foreign_key "gallery", "content", primary_key: "content_id", name: "fk_gallery_content1"
  add_foreign_key "gallery", "gallery_source", primary_key: "gallery_source_id", name: "fk_gallery_gallery_source1"
  add_foreign_key "gallery", "user", primary_key: "user_id", name: "fk_gallery_user1"
  add_foreign_key "gallery_has_scene_genre", "gallery", primary_key: "gallery_id", name: "fk_gallery_has_scene_genre_gallery1"
  add_foreign_key "gallery_has_scene_genre", "scene_genre", primary_key: "scene_genre_id", name: "fk_gallery_has_scene_genre_scene_genre1"
  add_foreign_key "gallery_property", "gallery", primary_key: "gallery_id", name: "fk_gallery_property_gallery1"
  add_foreign_key "gallery_source", "company", primary_key: "company_id", name: "fk_gallery_source_company1"
  add_foreign_key "gallery_source", "gallery_source_format", primary_key: "gallery_source_format_id", name: "fk_gallery_source_gallery_source_format1"
  add_foreign_key "gallery_source", "user", primary_key: "user_id", name: "fk_gallery_source_user1"
  add_foreign_key "image", "company", primary_key: "company_id", name: "fk_image_company"
  add_foreign_key "image", "content", primary_key: "content_id", name: "fk_image_content"
  add_foreign_key "image", "file_object_type", primary_key: "file_object_type_id", name: "fk_image_file_object_type"
  add_foreign_key "image", "storage", primary_key: "storage_id", name: "fk_image_storage"
  add_foreign_key "image", "upload", primary_key: "upload_id", name: "fk_image_upload"
  add_foreign_key "image", "user", primary_key: "user_id", name: "fk_image_user"
  add_foreign_key "image_encoded", "encoder_server", primary_key: "encoder_server_id", name: "fk_image_encoded_encoder_server"
  add_foreign_key "image_encoded", "image", primary_key: "image_id", name: "fk_image_encoded_image", on_delete: :cascade
  add_foreign_key "image_encoded", "image_encoding", primary_key: "image_encoding_id", name: "image_encoded_ibfk_1"
  add_foreign_key "image_encoding", "upload_extension", primary_key: "upload_extension_id", name: "fk_image_encoding_upload_extension"
  add_foreign_key "image_file", "image", primary_key: "image_id", name: "fk_image_file_image"
  add_foreign_key "image_file", "media", column: "media_id", primary_key: "media_id", name: "fk_image_file_media"
  add_foreign_key "label", "company", primary_key: "company_id", name: "fk_label_company"
  add_foreign_key "label", "content", primary_key: "content_id", name: "fk_label_content"
  add_foreign_key "line", "company", primary_key: "company_id", name: "fk_line_company"
  add_foreign_key "line", "content", primary_key: "content_id", name: "fk_line_content"
  add_foreign_key "line", "label", primary_key: "label_id", name: "fk_line_label"
  add_foreign_key "line_has_scene_genre", "line", primary_key: "line_id", name: "fk_line_has_scene_genre_line1"
  add_foreign_key "line_has_scene_genre", "scene_genre", primary_key: "scene_genre_id", name: "fk_line_has_scene_genre_scene_genre1"
  add_foreign_key "link_comment_content", "comment", primary_key: "comment_id", name: "fk_link_comment_content_comment"
  add_foreign_key "link_comment_content", "content", primary_key: "content_id", name: "fk_link_comment_content_content"
  add_foreign_key "link_comment_media", "comment", primary_key: "comment_id", name: "fk_link_comment_media_comment"
  add_foreign_key "link_comment_media", "media", column: "media_id", primary_key: "media_id", name: "fk_link_comment_media_media"
  add_foreign_key "link_content_forum", "content", primary_key: "content_id", name: "fk_link_content_forum_content"
  add_foreign_key "link_content_niche", "content", primary_key: "content_id", name: "fk_link_scene_niche_content1"
  add_foreign_key "link_content_niche", "media", column: "media_id", primary_key: "media_id", name: "fk_link_scene_niche_media1"
  add_foreign_key "link_content_niche", "niche", primary_key: "niche_id", name: "fk_link_scene_niche_niche1"
  add_foreign_key "link_content_thread", "content", primary_key: "content_id", name: "fk_link_content_thread_content"
  add_foreign_key "link_cue_scene_genre", "cue", primary_key: "cue_id", name: "fk_link_cue_scene_genre_cue1"
  add_foreign_key "link_cue_scene_genre", "scene_genre", primary_key: "scene_genre_id", name: "fk_link_cue_scene_genre_scene_genre1"
  add_foreign_key "link_encoder_server_task", "encoder_server", primary_key: "encoder_server_id", name: "fk_link_encoder_server_task_encoder_server", on_update: :cascade
  add_foreign_key "link_encoder_server_task", "encoder_task", primary_key: "encoder_task_id", name: "fk_link_encoder_server_task_encoder_task"
  add_foreign_key "link_file_object_type_extension", "file_object_type", primary_key: "file_object_type_id", name: "fk_link_file_object_type_extension_file_object_type"
  add_foreign_key "link_file_object_type_extension", "upload_extension", primary_key: "upload_extension_id", name: "fk_link_file_object_type_extension_upload_extension"
  add_foreign_key "link_image_encoding_file_object_type", "file_object_type", primary_key: "file_object_type_id", name: "fk_link_image_encoding_file_object_type_file_object_type"
  add_foreign_key "link_image_encoding_file_object_type", "image_encoding", primary_key: "image_encoding_id", name: "fk_link_image_encoding_file_object_type_image_encoding"
  add_foreign_key "link_model_ids", "model", primary_key: "model_id", name: "fk_link_model_ids_model"
  add_foreign_key "link_model_ids", "model_ids", column: "model_ids_id", primary_key: "model_ids_id", name: "fk_link_model_ids_model_ids"
  add_foreign_key "link_model_stage_name", "model", primary_key: "model_id", name: "fk_link_model_stage_name_model", on_delete: :cascade
  add_foreign_key "link_model_stage_name", "model_stage_name", primary_key: "model_stage_name_id", name: "fk_link_model_stage_name_model_stage_name"
  add_foreign_key "link_product_content_release", "content_release", primary_key: "content_release_id", name: "fk_link_product_website_content_release_content_release", on_delete: :cascade
  add_foreign_key "link_scene_genre", "scene", primary_key: "scene_id", name: "fk_link_scene_category_scene"
  add_foreign_key "link_scene_genre", "scene_genre", primary_key: "scene_genre_id", name: "fk_link_scene_category_scene_category"
  add_foreign_key "link_scene_genre_forum", "scene_genre", primary_key: "scene_genre_id", name: "fk_link_scene_genre_forum_scene_genre"
  add_foreign_key "link_scene_genre_thread", "scene_genre", primary_key: "scene_genre_id", name: "fk_link_scene_genre_thread_scene_genre"
  add_foreign_key "link_scene_keywords", "scene", primary_key: "scene_id", name: "fk_link_scene_keywords_scene"
  add_foreign_key "link_scene_keywords", "scene_keywords", column: "scene_keywords_id", primary_key: "scene_keywords_id", name: "fk_link_scene_keywords_scene_keywords"
  add_foreign_key "link_scene_model", "model", primary_key: "model_id", name: "fk_link_scene_model_model"
  add_foreign_key "link_scene_model", "scene", primary_key: "scene_id", name: "fk_link_scene_model_scene"
  add_foreign_key "link_scene_movie", "movie", primary_key: "movie_id", name: "fk_link_scene_movie_movie"
  add_foreign_key "link_scene_movie", "scene", primary_key: "scene_id", name: "fk_link_scene_movie_scene"
  add_foreign_key "link_scene_subgenre_genre", "link_scene_genre", primary_key: "link_scene_genre_id", name: "fk_link_scene_subgenre_genre_link_scene_genre"
  add_foreign_key "link_scene_subgenre_genre", "scene_subgenre", primary_key: "scene_subgenre_id", name: "fk_link_scene_subgenre_genre_scene_subgenre"
  add_foreign_key "link_tag_brick", "link_tag_target_object_keyword", primary_key: "link_tag_target_object_keyword_id", name: "fk_link_tag_brick_keyw_rule", on_update: :cascade, on_delete: :nullify
  add_foreign_key "link_tag_brick", "link_tag_target_object_property", primary_key: "link_tag_target_object_property_id", name: "fk_link_tag_brick_top_rule", on_update: :cascade, on_delete: :nullify
  add_foreign_key "link_tag_brick", "tag", primary_key: "tag_id", name: "fk_link_bts_tag_brick_bts_tag", on_update: :cascade, on_delete: :cascade
  add_foreign_key "link_tag_brick", "tag_brick", primary_key: "tag_brick_id", name: "fk_link_bts_tag_brick_bts_brick1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "link_tag_content", "tag", primary_key: "tag_id", name: "fk_link_bts_tag_content_bts_tag1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "link_tag_object", "tag", primary_key: "tag_id", name: "fk_link_bts_tag_object_bts_tag1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "link_tag_target_object_keyword", "tag_keyword", primary_key: "tag_keyword_id", name: "fk_link_tag_target_object_keyword_tag_keyword1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "link_tag_target_object_keyword", "tag_target_object", primary_key: "tag_target_object_id", name: "fk_link_tag_target_object_keyword_tag_target_object1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "link_tag_target_object_property", "tag_object_property", primary_key: "tag_object_property_id", name: "fk_link_tag_target_object_property_tag_object_property1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "link_tag_target_object_property", "tag_target_object", primary_key: "tag_target_object_id", name: "fk_link_tag_target_object_property_tag_target_object1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "link_video_encoding_file_object_type", "file_object_type", primary_key: "file_object_type_id", name: "fk_link_video_encoding_file_object_type_file_object_type"
  add_foreign_key "link_video_encoding_file_object_type", "video_encoding", primary_key: "video_encoding_id", name: "fk_link_video_encoding_file_object_type_video_encoding"
  add_foreign_key "link_website_company", "company", primary_key: "company_id", name: "fk_link_website_company_company"
  add_foreign_key "link_website_user_content", "content", primary_key: "content_id", name: "fk_content_id"
  add_foreign_key "link_website_user_content", "website_user_content_permission_group", primary_key: "website_user_content_permission_group_id", name: "fk_website_user_content_permission_group_id"
  add_foreign_key "link_website_user_has_notification_event", "notification_event", primary_key: "notification_event_id", name: "fk_link_website_user_has_notification_event_notification_event1"
  add_foreign_key "link_website_user_permission_group", "permission_group", primary_key: "permission_group_id", name: "link_website_user_permission_group_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "media", "media", column: "source_media_id", primary_key: "media_id", name: "source_media"
  add_foreign_key "media", "media_type", primary_key: "media_type_id", name: "fk_media_media_type"
  add_foreign_key "media_casting2", "content", primary_key: "content_id", name: "media_casting2_ibfk_2"
  add_foreign_key "media_casting2", "media", column: "media_id", primary_key: "media_id", name: "media_casting2_ibfk_1", on_delete: :cascade
  add_foreign_key "media_has_keyword", "keyword", column: "keword_id", primary_key: "keyword_id", name: "keywo", on_delete: :cascade
  add_foreign_key "media_has_keyword", "media", column: "media_id", primary_key: "media_id", name: "fk_media_has_keyword_media_id"
  add_foreign_key "media_has_model", "media", column: "media_id", primary_key: "media_id", name: "fk_media_has_model_media_id"
  add_foreign_key "media_has_model", "model", primary_key: "model_id", name: "fk_media_has_model_model_id"
  add_foreign_key "media_info", "media", column: "media_id", primary_key: "media_id", name: "fk_media_info_media"
  add_foreign_key "media_rating", "media", column: "media_id", primary_key: "media_id", name: "fk_media_rating_media"
  add_foreign_key "message", "user", column: "sender_user_id", primary_key: "user_id", name: "fk_message_user1"
  add_foreign_key "model", "company", primary_key: "company_id", name: "fk_model_company"
  add_foreign_key "model", "content", primary_key: "content_id", name: "fk_model_content"
  add_foreign_key "model", "user", primary_key: "user_id", name: "fk_model_user"
  add_foreign_key "model_social_network", "model", primary_key: "model_id", name: "fk_model_social_network_model1"
  add_foreign_key "model_social_network", "social_network", primary_key: "social_network_id", name: "fk_model_social_network_social_network1"
  add_foreign_key "movie", "content", primary_key: "content_id", name: "fk_movie_content"
  add_foreign_key "movie", "line", primary_key: "line_id", name: "fk_movie_line"
  add_foreign_key "object_property", "object_property_name", column: "object_property_name", primary_key: "object_property_name", name: "fk_object_property_name"
  add_foreign_key "object_property", "object_type", column: "object_type", primary_key: "object_type", name: "fk_object_type"
  add_foreign_key "object_property_name", "object_type", column: "object_type", primary_key: "object_type", name: "fk_property_name_object_type"
  add_foreign_key "page_has_media", "media", column: "media_id", primary_key: "media_id", name: "fk_page_has_media_media1"
  add_foreign_key "page_has_media", "page", primary_key: "page_id", name: "fk_page_has_media_page1"
  add_foreign_key "poll_answer", "poll", primary_key: "poll_id", name: "poll_answer_ibfk_1"
  add_foreign_key "poster_account_log", "content_release", primary_key: "content_release_id", name: "content_Release_fk"
  add_foreign_key "poster_account_log", "poster_data_log", primary_key: "poster_data_log_id", name: "poster_data_log_fk"
  add_foreign_key "poster_account_log", "social_network_account", primary_key: "social_network_account_id", name: "social_network_account_fk"
  add_foreign_key "poster_data_log", "content", primary_key: "content_id", name: "content_releaes_fk"
  add_foreign_key "poster_task", "content_release", primary_key: "content_release_id", name: "cont_rel_id"
  add_foreign_key "product_bonus_website", "product_offer_website", primary_key: "product_offer_website_id", name: "fk_product_bonus_website_product_offer_website"
  add_foreign_key "product_offer", "product", primary_key: "product_id", name: "fk_product_offer_product"
  add_foreign_key "product_offer_website", "product_offer", primary_key: "product_offer_id", name: "fk_product_offer_website_product_offer"
  add_foreign_key "product_offer_website_bonus", "product_bonus_program", primary_key: "product_bonus_program_id", name: "fk_product_offer_website_bonus_product_bonus_program1"
  add_foreign_key "product_offer_website_bonus", "product_offer_website", primary_key: "product_offer_website_id", name: "fk_product_bonus_website_product_offer_website1"
  add_foreign_key "product_offer_website_bonus_custom_price", "product_offer", primary_key: "product_offer_id", name: "fk_product_offer_website_bonus_custom_price_product_offer1"
  add_foreign_key "product_offer_website_bonus_custom_price", "product_offer_website_bonus", column: "product_offer_website_bonus_id", primary_key: "product_offer_website_bonus_id", name: "fk_product_offer_website_bonus_custom_price_product_offer_web1"
  add_foreign_key "product_offer_website_has_bonus", "product_offer_website", primary_key: "product_offer_website_id", name: "fk_product_offer_website_has_product_offer_website_bonus_prod1"
  add_foreign_key "product_offer_website_has_bonus", "product_offer_website_bonus", column: "product_offer_website_bonus_id", primary_key: "product_offer_website_bonus_id", name: "fk_product_offer_website_has_product_offer_website_bonus_prod2"
  add_foreign_key "product_offer_website_has_bonus_program", "product_bonus_program", primary_key: "product_bonus_program_id", name: "fk_product_offer_website_has_product_bonus_program_product_bo1"
  add_foreign_key "product_offer_website_has_bonus_program", "product_offer_website", primary_key: "product_offer_website_id", name: "fk_product_offer_website_has_product_bonus_program_product_of1"
  add_foreign_key "product_offer_website_prize", "product_offer_website", primary_key: "product_offer_website_id", name: "fk_product_bonus_offer_website_product_offer_website1"
  add_foreign_key "product_package", "content", primary_key: "content_id", name: "fk_product_package_content1"
  add_foreign_key "product_package_business_rule_class_decline", "product_package", primary_key: "product_package_id", name: "fk_link_business_rule_class_product_package_product_package1"
  add_foreign_key "product_package_item", "product_offer", primary_key: "product_offer_id", name: "fk_product_package_item_product_offer1"
  add_foreign_key "product_package_item", "product_package", primary_key: "product_package_id", name: "fk_product_package_item_product_package1"
  add_foreign_key "product_price_rule", "product", primary_key: "product_id", name: "fk_product"
  add_foreign_key "product_price_rule", "product_price_group", primary_key: "product_price_group_id", name: "fk_product_price_group"
  add_foreign_key "product_website", "product", primary_key: "product_id", name: "fk_product_website_sale_product_content_sale"
  add_foreign_key "scene", "company", primary_key: "company_id", name: "fk_scene_company"
  add_foreign_key "scene", "content", primary_key: "content_id", name: "fk_scene_content"
  add_foreign_key "scene", "director", primary_key: "director_id", name: "fk_scene_director"
  add_foreign_key "scene", "line", primary_key: "line_id", name: "fk_scene_line"
  add_foreign_key "scene", "user", primary_key: "user_id", name: "fk_scene_user"
  add_foreign_key "scene_genre", "company", primary_key: "company_id", name: "fk_scene_category_company"
  add_foreign_key "scene_genre", "content", primary_key: "content_id", name: "fk_scene_genre_content1"
  add_foreign_key "scene_genre_synonym", "scene_genre", primary_key: "scene_genre_id", name: "fk_scene_genre_synonym_scene_genre1"
  add_foreign_key "scene_keywords", "company", primary_key: "company_id", name: "fk_scene_keywords_company"
  add_foreign_key "scene_subgenre", "company", primary_key: "company_id", name: "fk_scene_subgenre_company"
  add_foreign_key "scene_subgenre", "scene_genre", primary_key: "scene_genre_id", name: "fk_scene_subgenre_scene_genre"
  add_foreign_key "sms_operator_request_new", "txt_nation_network", primary_key: "txt_nation_network_id", name: "FK_sms_operator_request_new_txt_nation_network"
  add_foreign_key "spent_time", "content", primary_key: "content_id", name: "fk_spent_time_content1"
  add_foreign_key "spent_time", "file_object_type", primary_key: "file_object_type_id", name: "fk_spent_time_file_object_type1"
  add_foreign_key "spent_time", "user", primary_key: "user_id", name: "fk_spent_time_user1"
  add_foreign_key "spent_time", "user_schedule", primary_key: "user_schedule_id", name: "fk_spent_time_user_schedule1"
  add_foreign_key "timeline", "content", primary_key: "content_id", name: "timeline_ibfk_1"
  add_foreign_key "timeline", "image", primary_key: "image_id", name: "timeline_ibfk_2"
  add_foreign_key "timeline_has_media", "media", column: "media_id", primary_key: "media_id", name: "timeline_has_media_ibfk_2"
  add_foreign_key "timeline_has_media", "timeline", primary_key: "timeline_id", name: "timeline_has_media_ibfk_1"
  add_foreign_key "txt_nation_sms", "txt_nation_network", primary_key: "txt_nation_network_id", name: "fk_txt_nation_network"
  add_foreign_key "upload", "company", primary_key: "company_id", name: "fk_upload_company"
  add_foreign_key "upload", "content", primary_key: "content_id", name: "fk_upload_content"
  add_foreign_key "upload", "file_object_type", primary_key: "file_object_type_id", name: "fk_upload_file_object_type"
  add_foreign_key "upload", "upload_action", primary_key: "upload_action_id", name: "fk_upload_upload_action"
  add_foreign_key "upload", "user", primary_key: "user_id", name: "fk_upload_user"
  add_foreign_key "upload_item", "upload", primary_key: "upload_id", name: "fk_upload_item_upload1"
  add_foreign_key "upload_item", "upload_item", column: "source_upload_item_id", primary_key: "upload_item_id", name: "fk_upload_item_upload_item1"
  add_foreign_key "upload_slot", "content", column: "secondary_content_id", primary_key: "content_id", name: "fk_image_slot_content2"
  add_foreign_key "upload_slot", "content", primary_key: "content_id", name: "fk_image_slot_content1"
  add_foreign_key "upload_slot", "file_object_type", primary_key: "file_object_type_id", name: "fk_upload_slot_file_object_type1"
  add_foreign_key "upload_slot_file", "upload", primary_key: "upload_id", name: "fk_upload_slot_file_upload1"
  add_foreign_key "upload_slot_file", "upload_slot", primary_key: "upload_slot_id", name: "fk_image_slot_file_image_slot1"
  add_foreign_key "user_action_log", "user", primary_key: "user_id", name: "fk_user_log_user1"
  add_foreign_key "user_action_log", "user_action", primary_key: "user_action_id", name: "fk_user_action_log_user_action1"
  add_foreign_key "user_file", "user", primary_key: "user_id", name: "fk_user_file_user1"
  add_foreign_key "user_has_ftp_directory", "ftp_directory", primary_key: "ftp_directory_id", name: "fk_link_website_user_ftp_directory_ftp_directory1"
  add_foreign_key "user_has_ftp_directory", "user", primary_key: "user_id", name: "fk_link_website_user_ftp_directory_website_user1"
  add_foreign_key "user_has_message", "message", primary_key: "message_id", name: "fk_user_has_message_message1"
  add_foreign_key "user_has_message", "user", primary_key: "user_id", name: "fk_user_has_message_user1"
  add_foreign_key "user_has_notification_event", "notification_event", primary_key: "notification_event_id", name: "fk_user_has_notification_event_notification_event1"
  add_foreign_key "user_has_notification_event", "user", primary_key: "user_id", name: "fk_user_has_notification_event_user1"
  add_foreign_key "user_has_page_setting", "page", primary_key: "page_id", name: "fk_user_has_page_page1", on_delete: :cascade
  add_foreign_key "user_has_page_setting", "user", primary_key: "user_id", name: "fk_user_has_page_user1"
  add_foreign_key "user_has_permission_group", "permission_group", primary_key: "permission_group_id", name: "fk_user_has_permission_group_permission_group1"
  add_foreign_key "user_has_permission_group", "user", primary_key: "user_id", name: "fk_user_has_permission_group_user1"
  add_foreign_key "user_schedule", "user", primary_key: "user_id", name: "fk_user_schedule_user1"
  add_foreign_key "video", "company", primary_key: "company_id", name: "fk_video_company"
  add_foreign_key "video", "content", primary_key: "content_id", name: "fk_video_content"
  add_foreign_key "video", "file_object_type", primary_key: "file_object_type_id", name: "fk_video_file_object_type"
  add_foreign_key "video", "storage", primary_key: "storage_id", name: "fk_video_storage"
  add_foreign_key "video", "upload", primary_key: "upload_id", name: "fk_video_upload"
  add_foreign_key "video", "user", primary_key: "user_id", name: "fk_video_user"
  add_foreign_key "video_encode_queue", "video", primary_key: "video_id", name: "fk_video_encode_queue_video1"
  add_foreign_key "video_encode_queue", "video_encoded", primary_key: "video_encoded_id", name: "fk_video_encode_queue_video_encoded1", on_delete: :cascade
  add_foreign_key "video_encode_queue", "video_encoding", primary_key: "video_encoding_id", name: "fk_video_encode_queue_video_encoding1"
  add_foreign_key "video_encoded", "encoder_server", primary_key: "encoder_server_id", name: "fk_video_encoded_encoder_server"
  add_foreign_key "video_encoded", "video", primary_key: "video_id", name: "fk_video_encoded_video", on_delete: :cascade
  add_foreign_key "video_encoded", "video_file", primary_key: "video_file_id", name: "fk_video_encoded_video_file1"
  add_foreign_key "video_encoding", "upload_extension", primary_key: "upload_extension_id", name: "fk_video_encoding_upload_extension"
  add_foreign_key "video_file", "media", column: "media_id", primary_key: "media_id", name: "fk_video_file_media"
  add_foreign_key "video_file", "video", primary_key: "video_id", name: "fk_video_file_video", on_delete: :cascade
  add_foreign_key "video_file", "video_file", column: "source_video_file_id", primary_key: "video_file_id", name: "fk_video_file_video_file1", on_delete: :cascade
  add_foreign_key "video_transcoding_matrix", "video_encoding", column: "source_video_encoding_id", primary_key: "video_encoding_id", name: "fk_video_transcoding_matrix_video_encoding2"
  add_foreign_key "video_transcoding_matrix", "video_encoding", column: "target_video_encoding_id", primary_key: "video_encoding_id", name: "fk_video_transcoding_matrix_video_encoding1"
  add_foreign_key "vob_chapter", "content", primary_key: "content_id", name: "fk_vob_chapter_content"
  add_foreign_key "vob_chapter", "scene", primary_key: "scene_id", name: "fk_vob_chapter_scene"
  add_foreign_key "vob_chapter", "upload", primary_key: "upload_id", name: "fk_vob_chapter_upload"
  add_foreign_key "vob_chapter", "vob", name: "fk_vob_chapter_1"
  add_foreign_key "website_user_feed_dose", "website_user_feed_subscription", primary_key: "website_user_feed_subscription_id", name: "fk_website_user_feed_subscription_has_feed_dose_website_user_1"
  add_foreign_key "website_user_feed_dose_has_content", "content", primary_key: "content_id", name: "fk_website_user_feed_dose_has_content_content1"
  add_foreign_key "website_user_feed_dose_has_content", "website_user_feed_dose", primary_key: "website_user_feed_dose_id", name: "fk_website_user_feed_dose_has_content_website_user_feed_dose1"
  add_foreign_key "website_user_feed_subscription", "feed", primary_key: "feed_id", name: "fk_website_user_has_feed_feed1"
end
