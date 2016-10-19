class CreateGtfVideoEncodings < ActiveRecord::Migration
  def change
    create_table "video_encoding", primary_key: "video_encoding_id", force: :cascade do |t|
      # t.integer "upload_extension_id",   limit: 4,                 null: false
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
    # add_index "video_encoding", ["upload_extension_id"], name: "fk_video_encoding_upload_extension", using: :btree
  end
end
