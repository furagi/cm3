class CreateFileObjectTypes < ActiveRecord::Migration
  def change
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


  end
end
