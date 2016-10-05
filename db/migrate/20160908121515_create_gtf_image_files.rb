class CreateGtfImageFiles < ActiveRecord::Migration
  def change
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

  end
end
