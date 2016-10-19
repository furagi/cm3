class CreateGtfVideoFiles < ActiveRecord::Migration
  def change
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
end
