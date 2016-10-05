class CreateGtfVideos < ActiveRecord::Migration
  def change
    create_table "video", primary_key: "video_id", force: :cascade do |t|
      t.integer  "upload_id",                limit: 4,                      null: false
      t.integer  "file_object_type_id",      limit: 4,                      null: false
      t.integer  "company_id",               limit: 4,                      null: false
      t.integer  "user_id",                  limit: 4,                      null: false
      t.integer  "content_id",               limit: 4
      t.integer  "secondary_content_id",     limit: 4
      t.integer  "storage_id",               limit: 4,                      null: false
      t.string   "subpath",                  limit: 20,                     null: false
      t.string   "url",                      limit: 45,                     null: false
      t.integer  "video_order",              limit: 4,                      null: false
      t.datetime "created",                                                 null: false
      t.string   "status",                   limit: 7,  default: "active",  null: false
      t.string   "subscription_news_state",  limit: 9,  default: "waiting", null: false
      t.string   "exporting_to_dmca_status", limit: 8
    end

    add_index "video", ["company_id"], name: "fk_video_company", using: :btree
    add_index "video", ["content_id"], name: "fk_video_content", using: :btree
    add_index "video", ["file_object_type_id"], name: "fk_video_file_object_type", using: :btree
    # add_index "video", ["secondary_content_id"], name: "secondary_content", using: :btree
    add_index "video", ["storage_id"], name: "fk_video_storage", using: :btree
    add_index "video", ["upload_id"], name: "fk_video_upload", using: :btree
    add_index "video", ["user_id"], name: "fk_video_user", using: :btree

  end
end
