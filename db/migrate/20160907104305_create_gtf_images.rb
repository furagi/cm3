class CreateGtfImages < ActiveRecord::Migration
  def change
    create_table "image", primary_key: "image_id", force: :cascade do |t|
      t.integer  "upload_id",            limit: 4,                     null: false
      t.integer  "file_object_type_id",  limit: 4,                     null: false
      t.integer  "company_id",           limit: 4,                     null: false
      t.integer  "user_id",              limit: 4,                     null: false
      t.integer  "content_id",           limit: 4
      # t.integer  "secondary_content_id", limit: 4
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
    # add_index "image", ["secondary_content_id"], name: "secondary_content", using: :btree
    add_index "image", ["status"], name: "status", using: :btree
    add_index "image", ["storage_id"], name: "fk_image_storage", using: :btree
    add_index "image", ["upload_id"], name: "fk_image_upload", using: :btree
    add_index "image", ["user_id"], name: "fk_image_user", using: :btree
  end
end
