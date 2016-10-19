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

  create_table "activation_request", primary_key: "activation_request_id", force: :cascade do |t|
    t.datetime "time",             null: false
    t.string   "ip",    limit: 15
    t.string   "email", limit: 45
  end

  create_table "box_invalidator_queue", primary_key: "box_invalidator_queue_id", force: :cascade do |t|
    t.integer  "website_user_id", limit: 4,  null: false
    t.string   "resource_type",   limit: 7,  null: false
    t.string   "resource",        limit: 17
    t.integer  "value",           limit: 4
    t.datetime "created",                    null: false
  end

  add_index "box_invalidator_queue", ["website_user_id"], name: "website_user_id", using: :btree

  create_table "browser_pin", primary_key: "browser_pin_id", force: :cascade do |t|
    t.integer  "previous_browser_pin_id",          limit: 8
    t.string   "hash",                             limit: 50,                  null: false
    t.datetime "created",                                                      null: false
    t.string   "http_user_agent",                  limit: 1000
    t.integer  "downstream_bandwidth",             limit: 4
    t.datetime "downstream_bandwidth_last_update"
    t.string   "is_agreement_accepted",            limit: 3,    default: "no", null: false
    t.string   "was_authenticated_on_idcert",      limit: 3,    default: "no"
    t.string   "is_used",                          limit: 3,    default: "no", null: false
  end

  add_index "browser_pin", ["hash"], name: "hash", unique: true, using: :btree
  add_index "browser_pin", ["previous_browser_pin_id"], name: "fk_browser_pin_browser_pin1", using: :btree

  create_table "browser_pin_track", primary_key: "browser_pin_track_id", force: :cascade do |t|
    t.integer  "browser_pin_id",  limit: 8,  null: false
    t.integer  "website_id",      limit: 4,  null: false
    t.integer  "track_id",        limit: 4
    t.integer  "http_referer_id", limit: 8,  null: false
    t.string   "ip_address",      limit: 45
    t.datetime "created",                    null: false
  end

  add_index "browser_pin_track", ["browser_pin_id"], name: "fk_browser_pin_track_browser_pin1", using: :btree
  add_index "browser_pin_track", ["track_id"], name: "fk_browser_pin_track_website_user1", using: :btree
  add_index "browser_pin_track", ["website_id"], name: "fk_browser_pin_track_website1", using: :btree

  create_table "cancellation_feedback", primary_key: "cancellation_feedback_id", force: :cascade do |t|
    t.integer  "good_id", limit: 4,    null: false
    t.datetime "created",              null: false
    t.string   "email",   limit: 100
    t.string   "reason",  limit: 1000
    t.string   "message", limit: 1000
    t.integer  "user_id", limit: 4
  end

  add_index "cancellation_feedback", ["good_id"], name: "fk_cancellation_feedback_link_website_user_resource1", using: :btree

  create_table "captcha", primary_key: "captcha_id", force: :cascade do |t|
    t.string   "private_code", limit: 5,  null: false
    t.string   "public_code",  limit: 16, null: false
    t.datetime "created",                 null: false
  end

  create_table "config", primary_key: "config_id", force: :cascade do |t|
    t.string "constant",    limit: 50,  null: false
    t.string "value",       limit: 100, null: false
    t.string "description", limit: 500, null: false
  end

  create_table "corrupted_passwords", primary_key: "corrupted_passwords_id", force: :cascade do |t|
    t.integer  "website_user_id", limit: 4
    t.string   "password",        limit: 45, null: false
    t.datetime "corrupted_date",             null: false
  end

  add_index "corrupted_passwords", ["website_user_id"], name: "website_user_id", using: :btree

  create_table "failed_login_attempt", primary_key: "failed_login_attempt_id", force: :cascade do |t|
    t.datetime "time",                                       null: false
    t.string   "ip",          limit: 15
    t.string   "device_code", limit: 32
    t.string   "username",    limit: 45
    t.string   "auth_module", limit: 8,  default: "website"
    t.string   "can_delete",  limit: 3,  default: "yes",     null: false
  end

  create_table "faq", primary_key: "faq_id", force: :cascade do |t|
    t.string "website_class", limit: 45
    t.string "name",          limit: 45,    null: false
    t.string "html_question", limit: 100,   null: false
    t.string "html_title",    limit: 100,   null: false
    t.text   "html_text",     limit: 65535, null: false
  end

  create_table "favorite_content", primary_key: "favorite_content_id", force: :cascade do |t|
    t.integer  "link_website_user_id", limit: 4,                null: false
    t.integer  "content_id",           limit: 4,                null: false
    t.string   "is_favorite",          limit: 3, default: "no", null: false
    t.string   "is_playlist",          limit: 3, default: "no", null: false
    t.string   "is_in_box",            limit: 3, default: "no", null: false
    t.integer  "favorite_order",       limit: 4, default: 0,    null: false
    t.integer  "playlist_order",       limit: 4, default: 0,    null: false
    t.integer  "favorite_item_type",   limit: 4, default: 0,    null: false
    t.integer  "item_order",           limit: 4, default: 0,    null: false
    t.datetime "created",                                       null: false
  end

  add_index "favorite_content", ["content_id"], name: "fk_favorite_content_content", using: :btree
  add_index "favorite_content", ["is_favorite"], name: "is_favorite", using: :btree
  add_index "favorite_content", ["is_playlist"], name: "is_playlist", using: :btree
  add_index "favorite_content", ["item_order"], name: "item_order", using: :btree
  add_index "favorite_content", ["link_website_user_id"], name: "fk_favorite_content_link_website_user", using: :btree

  create_table "good", primary_key: "good_id", force: :cascade do |t|
    t.integer  "website_user_id",       limit: 4,                  null: false
    t.datetime "created",                                          null: false
    t.datetime "recharged"
    t.integer  "resource_type_id",      limit: 4,                  null: false
    t.integer  "resource_id",           limit: 4,   default: 0
    t.float    "value",                 limit: 24
    t.string   "mode",                  limit: 100
    t.integer  "cart_item_id",          limit: 4
    t.datetime "expiration"
    t.string   "is_recurring",          limit: 3,   default: "no", null: false
    t.integer  "recurring_period",      limit: 4,   default: 0,    null: false
    t.integer  "expiration_period",     limit: 4,   default: 0,    null: false
    t.integer  "phase",                 limit: 4,   default: 1,    null: false
    t.float    "recurring_price",       limit: 24
    t.integer  "payment_id",            limit: 4
    t.string   "recurring_state",       limit: 10
    t.string   "status",                limit: 9
    t.string   "reset_on_cancellation", limit: 3,   default: "no"
    t.string   "stop_recurring",        limit: 3,   default: "no"
    t.string   "created_by",            limit: 5,                  null: false
  end

  add_index "good", ["cart_item_id"], name: "fk_link_website_user_resource_cart_item1", using: :btree
  add_index "good", ["resource_type_id", "resource_id"], name: "resource_type_id", using: :btree
  add_index "good", ["resource_type_id"], name: "link_website_user_resource_ibfk_2", using: :btree
  add_index "good", ["website_user_id"], name: "website_user_id", using: :btree

  create_table "good_activation_log", primary_key: "good_activation_log_id", force: :cascade do |t|
    t.integer  "good_id",            limit: 4
    t.integer  "cart_item_id",       limit: 4
    t.datetime "created",                        null: false
    t.integer  "user_id",            limit: 4
    t.string   "is_success",         limit: 3,   null: false
    t.string   "activation_message", limit: 255, null: false
    t.string   "is_new_resource",    limit: 3,   null: false
    t.boolean  "before_active",      limit: 1
    t.float    "before_value",       limit: 24
    t.datetime "before_expiration"
    t.string   "before_mode",        limit: 20
    t.integer  "before_phase",       limit: 4
    t.string   "before_website_ids", limit: 100, null: false
    t.boolean  "after_active",       limit: 1
    t.float    "after_value",        limit: 24
    t.datetime "after_expiration"
    t.string   "after_mode",         limit: 20
    t.integer  "after_phase",        limit: 4
    t.string   "after_website_ids",  limit: 100, null: false
  end

  add_index "good_activation_log", ["cart_item_id"], name: "fk_cart_item_activation_log_cart_item1", using: :btree
  add_index "good_activation_log", ["good_id"], name: "fk_resource_activation_log_link_website_user_resource1", using: :btree

  create_table "good_dump", primary_key: "good_id", force: :cascade do |t|
    t.integer  "website_user_id",       limit: 4,                  null: false
    t.datetime "created",                                          null: false
    t.datetime "recharged"
    t.integer  "resource_type_id",      limit: 4,                  null: false
    t.integer  "resource_id",           limit: 4,   default: 0
    t.float    "value",                 limit: 24
    t.string   "mode",                  limit: 100
    t.integer  "cart_item_id",          limit: 4
    t.datetime "expiration"
    t.string   "is_recurring",          limit: 3,   default: "no", null: false
    t.integer  "recurring_period",      limit: 4,   default: 0,    null: false
    t.integer  "expiration_period",     limit: 4,   default: 0,    null: false
    t.integer  "phase",                 limit: 4,   default: 1,    null: false
    t.float    "recurring_price",       limit: 24
    t.integer  "payment_id",            limit: 4
    t.string   "recurring_state",       limit: 10
    t.string   "status",                limit: 9
    t.string   "reset_on_cancellation", limit: 3,   default: "no"
    t.string   "stop_recurring",        limit: 3,   default: "no"
    t.string   "created_by",            limit: 5,                  null: false
  end

  create_table "good_unlimited", id: false, force: :cascade do |t|
    t.integer "good_id",            limit: 4, null: false
    t.integer "membership_good_id", limit: 4, null: false
  end

  add_index "good_unlimited", ["good_id"], name: "good_id", unique: true, using: :btree

  create_table "http_referer", primary_key: "http_referer_id", force: :cascade do |t|
    t.integer  "browser_pin_id",       limit: 8
    t.datetime "created",                           null: false
    t.string   "http_referer",         limit: 1000, null: false
    t.string   "ip_address",           limit: 45,   null: false
    t.string   "http_x_forwarded_for", limit: 64
    t.string   "target_page",          limit: 1000
  end

  add_index "http_referer", ["browser_pin_id"], name: "fk_http_referer_browser_pin", using: :btree
  add_index "http_referer", ["ip_address"], name: "preview_counter_ip_address", using: :btree

  create_table "link_website_user", primary_key: "link_website_user_id", force: :cascade do |t|
    t.integer  "website_id",                       limit: 4,                     null: false
    t.integer  "website_user_id",                  limit: 4,                     null: false
    t.integer  "logins",                           limit: 4
    t.integer  "clicks",                           limit: 4
    t.datetime "last_login"
    t.boolean  "active",                           limit: 1, default: true,      null: false
    t.integer  "source_track_id",                  limit: 8
    t.string   "is_trackable",                     limit: 7, default: "unknown", null: false
    t.datetime "created",                                                        null: false
    t.string   "access_to_others_website_content", limit: 3, default: "no",      null: false
  end

  add_index "link_website_user", ["last_login"], name: "last_login", using: :btree
  add_index "link_website_user", ["website_id", "website_user_id"], name: "unique_user_site", unique: true, using: :btree
  add_index "link_website_user", ["website_id", "website_user_id"], name: "unique_website_n_user", unique: true, using: :btree
  add_index "link_website_user", ["website_id", "website_user_id"], name: "website_id", unique: true, using: :btree
  add_index "link_website_user", ["website_user_id"], name: "fk_link_website_user_website_user", using: :btree

  create_table "notification_event", primary_key: "notification_event_id", force: :cascade do |t|
    t.string "event",          limit: 250
    t.string "constant",       limit: 100,   null: false
    t.string "message_option", limit: 13
    t.string "email_option",   limit: 13
    t.text   "description",    limit: 65535
  end

  add_index "notification_event", ["constant"], name: "not_ev_constant", unique: true, using: :btree

  create_table "phone_number", primary_key: "phone_number_id", force: :cascade do |t|
    t.datetime "created",                    null: false
    t.integer  "website_user_id", limit: 4,  null: false
    t.string   "number",          limit: 16, null: false
  end

  add_index "phone_number", ["website_user_id"], name: "website_user_id", using: :btree

  create_table "phone_validation_requests", primary_key: "phone_validation_requests_id", force: :cascade do |t|
    t.integer  "website_user_phones_id", limit: 4
    t.string   "validation_code",        limit: 45,                 null: false
    t.datetime "sent",                                              null: false
    t.string   "status",                 limit: 7,  default: "new", null: false
  end

  add_index "phone_validation_requests", ["website_user_phones_id"], name: "website_user_phones_id", using: :btree

  create_table "resource_type", primary_key: "resource_type_id", force: :cascade do |t|
    t.string "name",                         limit: 100,               null: false
    t.string "constant",                     limit: 100,               null: false
    t.string "description",                  limit: 255
    t.float  "reset_on_expiration_to_value", limit: 24,  default: 0.0, null: false
    t.string "mergin_type",                  limit: 10,                null: false
    t.time   "params",                       limit: 0,                 null: false
  end

  add_index "resource_type", ["constant"], name: "idx_constant_unique", unique: true, using: :btree

  create_table "unblock_account_state", primary_key: "unblock_account_state_id", force: :cascade do |t|
    t.integer  "website_user_id", limit: 4
    t.string   "state",           limit: 23, default: "sessions_validation", null: false
    t.string   "status",          limit: 9,  default: "started",             null: false
    t.datetime "start_date"
    t.datetime "expiration_date"
    t.datetime "end_date"
  end

  add_index "unblock_account_state", ["website_user_id"], name: "website_user_id", using: :btree

  create_table "website_has_good", primary_key: "website_has_good_id", force: :cascade do |t|
    t.integer "website_id", limit: 4, null: false
    t.integer "good_id",    limit: 4, null: false
  end

  add_index "website_has_good", ["good_id"], name: "good_id", using: :btree
  add_index "website_has_good", ["website_id", "good_id"], name: "unique_link", unique: true, using: :btree
  add_index "website_has_good", ["website_id"], name: "website_id", using: :btree

  create_table "website_session", primary_key: "website_session_id", force: :cascade do |t|
    t.integer  "website_id",                    limit: 4
    t.integer  "link_website_user_id",          limit: 4
    t.integer  "browser_pin_id",                limit: 8
    t.integer  "http_referer_id",               limit: 8
    t.integer  "track_id",                      limit: 8
    t.integer  "tracking_url_click_id",         limit: 4
    t.string   "hash",                          limit: 45,                          null: false
    t.string   "ip_address",                    limit: 45,                          null: false
    t.datetime "started",                                                           null: false
    t.string   "http_x_forwarded_for",          limit: 64,                          null: false
    t.string   "http_via",                      limit: 128,                         null: false
    t.string   "http_user_agent",               limit: 255,                         null: false
    t.string   "http_referer",                  limit: 1000
    t.string   "is_new_user_registered",        limit: 3,     default: "no",        null: false
    t.text     "user_data",                     limit: 65535
    t.string   "type",                          limit: 8,     default: "personal",  null: false
    t.integer  "country_id",                    limit: 4
    t.integer  "geoip_city_location_unique_id", limit: 4
    t.string   "traffic_type",                  limit: 9,     default: "undefined"
    t.string   "is_active",                     limit: 3,     default: "yes",       null: false
    t.string   "verified_by_user",              limit: 3,     default: "no",        null: false
  end

  add_index "website_session", ["browser_pin_id"], name: "fk_website_session_browser_pin1", using: :btree
  add_index "website_session", ["country_id"], name: "fk_website_session_country1", using: :btree
  add_index "website_session", ["geoip_city_location_unique_id"], name: "geoip_city_location_unique_id", using: :btree
  add_index "website_session", ["hash"], name: "website_session_hash", using: :btree
  add_index "website_session", ["http_referer_id"], name: "fk_website_session_http_referer1", using: :btree
  add_index "website_session", ["link_website_user_id"], name: "fk_website_session_link_website_user1", using: :btree
  add_index "website_session", ["track_id"], name: "track_id", using: :btree
  add_index "website_session", ["tracking_url_click_id"], name: "fk_website_session_referral_url_click1", using: :btree
  add_index "website_session", ["type"], name: "websession_type", using: :btree
  add_index "website_session", ["website_id"], name: "fk_website_id", using: :btree

  create_table "website_session_log", primary_key: "website_session_log_id", force: :cascade do |t|
    t.integer "website_session_id", limit: 4,     null: false
    t.text    "message",            limit: 65535, null: false
  end



  create_table "website_user_activation", primary_key: "website_user_activation_id", force: :cascade do |t|
    t.integer  "website_user_id", limit: 4,                    null: false
    t.datetime "created",                                      null: false
    t.string   "activation_id",   limit: 45,                   null: false
    t.string   "type",            limit: 14,                   null: false
    t.integer  "website_id",      limit: 4
    t.text     "url",             limit: 65535
    t.string   "is_used",         limit: 3,     default: "No"
  end

  add_index "website_user_activation", ["website_id"], name: "website_id", using: :btree
  add_index "website_user_activation", ["website_user_id"], name: "fk_website_user_activation_website_user", using: :btree

  create_table "website_user_content", primary_key: "website_user_content_id", force: :cascade do |t|
    t.integer  "content_id",                limit: 4,             null: false
    t.integer  "link_website_user_id",      limit: 4,             null: false
    t.string   "website_user_content_type", limit: 8,             null: false
    t.integer  "item_order",                limit: 4, default: 0, null: false
    t.datetime "created",                                         null: false
  end

  add_index "website_user_content", ["content_id"], name: "content_id", using: :btree
  add_index "website_user_content", ["link_website_user_id"], name: "link_website_user_id", using: :btree

  create_table "website_user_phones", primary_key: "website_user_phones_id", force: :cascade do |t|
    t.integer "website_user_id", limit: 4
    t.string  "phone_number",    limit: 45,                 null: false
    t.string  "status",          limit: 9,  default: "new", null: false
  end

  add_index "website_user_phones", ["website_user_id"], name: "website_user_id", using: :btree

  create_table "website_user_unblock_attempt", primary_key: "website_user_unblock_attempt_id", force: :cascade do |t|
    t.string  "method",          limit: 3, default: "cc", null: false
    t.integer "quantity",        limit: 4,                null: false
    t.integer "website_user_id", limit: 8,                null: false
  end

  add_index "website_user_unblock_attempt", ["website_user_id"], name: "fk_unblock_account_attempt_website_user1", using: :btree

  add_foreign_key "box_invalidator_queue", "website_user", primary_key: "website_user_id", name: "box_invalidator_queue_ibfk_1"
  add_foreign_key "browser_pin_track", "website", primary_key: "website_id", name: "browser_pin_track_ibfk_1"
  add_foreign_key "cancellation_feedback", "good", primary_key: "good_id", name: "cancellation_feedback_ibfk_1", on_delete: :cascade
  add_foreign_key "corrupted_passwords", "website_user", primary_key: "website_user_id", name: "corrupted_passwords_ibfk_1"
  add_foreign_key "favorite_content", "link_website_user", primary_key: "link_website_user_id", name: "favorite_content_ibfk_1"
  add_foreign_key "good", "resource_type", primary_key: "resource_type_id", name: "good_ibfk_1"
  add_foreign_key "good_activation_log", "good", primary_key: "good_id", name: "fk_resource_activation_log_link_website_user_resource1"
  add_foreign_key "link_website_user", "website", primary_key: "website_id", name: "link_website_user_ibfk_4"
  add_foreign_key "link_website_user", "website_user", primary_key: "website_user_id", name: "link_website_user_ibfk_3"
  add_foreign_key "phone_number", "website_user", primary_key: "website_user_id", name: "phone_number_ibfk_1"
  add_foreign_key "website_has_good", "good", primary_key: "good_id", name: "website_has_good_ibfk_2", on_delete: :cascade
  add_foreign_key "website_has_good", "website", primary_key: "website_id", name: "website_has_good_ibfk_3"
  add_foreign_key "website_session", "browser_pin", primary_key: "browser_pin_id", name: "website_session_ibfk_2"
  add_foreign_key "website_session", "country", primary_key: "country_id", name: "website_session_ibfk_3"
  add_foreign_key "website_session", "link_website_user", primary_key: "link_website_user_id", name: "fk_website_session_link_website_user1"
  add_foreign_key "website_session", "website", primary_key: "website_id", name: "website_session_ibfk_1"
  add_foreign_key "website_user_activation", "website", primary_key: "website_id", name: "website_user_activation_ibfk_1"
  add_foreign_key "website_user_content", "link_website_user", primary_key: "link_website_user_id", name: "website_user_content_ibfk_1"
end
