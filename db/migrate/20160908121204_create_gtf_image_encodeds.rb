class CreateGtfImageEncodeds < ActiveRecord::Migration
  def change
    create_table "image_encoded", primary_key: "image_encoded_id", force: :cascade do |t|
      t.integer  "image_id",          limit: 4,    null: false
      t.integer  "image_encoding_id", limit: 4,    null: false
      t.integer  "encoder_server_id", limit: 4,    null: false
      t.datetime "encode_start",                   null: false
      t.datetime "encode_finish",                  null: false
      t.string   "encode_status",     limit: 10,   null: false
      t.string   "encode_log",        limit: 1000, null: false
    end

    add_index "image_encoded", ["encoder_server_id"], name: "fk_image_encoded_encoder_server", using: :btree
    add_index "image_encoded", ["image_encoding_id"], name: "image_encoding_id", using: :btree
    add_index "image_encoded", ["image_id"], name: "fk_image_encoded_image", using: :btree

  end
end
