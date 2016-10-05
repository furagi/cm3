class User < ActiveRecord::Migration
  def change
    create_table "user", primary_key: "user_id" do |t|
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
end
