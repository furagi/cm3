class CreateGtfUploads < ActiveRecord::Migration
  def change
    create_table "upload", primary_key: "upload_id", force: :cascade do |t|
      t.integer  "upload_action_id",                     limit: 4,                                null: false
      t.integer  "file_object_type_id",                  limit: 4,                                null: false
      t.datetime "created",                                                                       null: false
      t.integer  "company_id",                           limit: 4,                                null: false
      t.integer  "user_id",                              limit: 4,                                null: false
      t.integer  "content_id",                           limit: 4
      t.integer  "secondary_content_id",                 limit: 4
      t.integer  "target_id",                            limit: 4
      t.string   "upload_subpath",                       limit: 20000,                            null: false
      t.datetime "upload_start"
      t.datetime "upload_finish"
      t.string   "status",                               limit: 50,    default: "Upload waiting"
      t.string   "upload_status",                        limit: 10,    default: "waiting",        null: false
      t.string   "encode_status",                        limit: 10,    default: "waiting",        null: false
      t.string   "processing_status",                    limit: 10,    default: "waiting",        null: false
      t.string   "options",                              limit: 100
      t.string   "json_options",                         limit: 255
      t.string   "encoder_message",                      limit: 200
      # t.integer  "spent_time_id",                        limit: 4
      t.integer  "priority",                             limit: 4,     default: 0,                null: false
      t.integer  "warnings",                             limit: 4,     default: 0,                null: false
      t.string   "upload_mode",                          limit: 3,     default: "ftp",            null: false
      t.string   "rebuild_status_of_affected_resources", limit: 10,    default: "skipped"
    end

    add_index "upload", ["company_id"], name: "fk_upload_company", using: :btree
    add_index "upload", ["content_id"], name: "fk_upload_content", using: :btree
    add_index "upload", ["encode_status"], name: "encode_status", using: :btree
    add_index "upload", ["file_object_type_id"], name: "fk_upload_file_object_type", using: :btree
    add_index "upload", ["processing_status"], name: "processing_status", using: :btree
    add_index "upload", ["secondary_content_id"], name: "secondary_content", using: :btree
    # add_index "upload", ["spent_time_id"], name: "fk_upload_spent_time1", using: :btree
    add_index "upload", ["upload_action_id"], name: "fk_upload_upload_action", using: :btree
    add_index "upload", ["upload_status", "encode_status", "rebuild_status_of_affected_resources"], name: "upload_status_2", using: :btree
    add_index "upload", ["upload_status"], name: "upload_status", using: :btree
    add_index "upload", ["user_id"], name: "fk_upload_user", using: :btree
  end
end
