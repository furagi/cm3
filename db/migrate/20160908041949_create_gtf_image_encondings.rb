class CreateGtfImageEncondings < ActiveRecord::Migration
  def change
    create_table "image_encoding", primary_key: "image_encoding_id", force: :cascade do |t|
      t.integer "upload_extension_id", limit: 4,                 null: false
      t.string  "name",                limit: 30,                null: false
      t.string  "constant",            limit: 45,                null: false
      t.integer "width",               limit: 4,                 null: false
      t.integer "height",              limit: 4,                 null: false
      t.integer "quality",             limit: 4,  default: 0,    null: false
      t.string  "resize",              limit: 1,                 null: false
      t.string  "autorotate",          limit: 1,                 null: false
      t.integer "watermark_id",        limit: 4,                 null: false
      t.string  "description",         limit: 60,                null: false
      t.string  "is_zip_archive",      limit: 3,  default: "no", null: false
    end

    add_index "image_encoding", ["constant"], name: "constant", using: :btree
    add_index "image_encoding", ["upload_extension_id"], name: "fk_image_encoding_upload_extension", using: :btree

  end
end
