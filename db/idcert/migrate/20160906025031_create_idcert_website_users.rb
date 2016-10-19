class CreateIdcertWebsiteUsers < ActiveRecord::Migration
  def change
    create_table "website_user", primary_key: "website_user_id", force: :cascade do |t|
      t.string   "username",               limit: 45
      t.string   "last_name",              limit: 30,                                 null: false
      t.string   "email",                  limit: 100,                                null: false
      t.string   "first_name",             limit: 30,                                 null: false
      t.string   "password",               limit: 255,                                null: false
      t.datetime "created",                                                           null: false
      t.datetime "last_login",                                                        null: false
      t.integer  "logins",                 limit: 4,                                  null: false
      t.string   "active",                 limit: 1,                                  null: false
      t.string   "confirmation_code",      limit: 255,                                null: false
      t.integer  "country_id",             limit: 4,                                  null: false
      t.integer  "currency_id",            limit: 4,                                  null: false
      t.datetime "birth_date"
      t.integer  "last_fresh_id",          limit: 4
      t.string   "sex",                    limit: 6
      t.string   "sexual_preferences",     limit: 12
      t.integer  "vbulletin_id",           limit: 4,     default: 0,                  null: false
      t.integer  "user_id",                limit: 4,                                  null: false
      t.integer  "tbdev_user_id",          limit: 4
      t.string   "feed_auto_subscription", limit: 7,     default: "allowed",          null: false
      t.string   "is_trusted",             limit: 3,     default: "no",               null: false
      t.integer  "external_user_id_i",     limit: 4
      t.string   "external_user_id_s",     limit: 255
      t.text     "notes",                  limit: 65535
      t.datetime "password_update"
      t.string   "is_temporary_account",   limit: 3,     default: "no",               null: false
      t.string   "player_mode",            limit: 8,     default: "standard",         null: false
      t.string   "poll",                   limit: 16,    default: "waiting_purchase", null: false
    end

    add_index "website_user", ["country_id"], name: "country_id", using: :btree
    add_index "website_user", ["currency_id"], name: "currency_id", using: :btree
    add_index "website_user", ["email"], name: "unique_email", unique: true, using: :btree
    add_index "website_user", ["username"], name: "unique_username", unique: true, using: :btree
  end
end
