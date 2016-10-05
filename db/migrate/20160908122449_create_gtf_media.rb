class CreateGtfMedia < ActiveRecord::Migration
  def change
    create_table "media", primary_key: "media_id", force: :cascade do |t|
      t.integer "media_type_id",          limit: 4,               null: false
      t.integer "source_media_id",        limit: 4
      t.string  "lighttp_options",        limit: 45
      t.integer "comments",               limit: 4,               null: false
      t.integer "ratings",                limit: 4,               null: false
      t.integer "average_rating",         limit: 4,               null: false
      t.integer "views",                  limit: 4,               null: false
      t.integer "downloads",              limit: 4,               null: false
      t.string  "hot",                    limit: 1,               null: false
      t.integer "peers",                  limit: 4,               null: false
      t.integer "seeds",                  limit: 4,               null: false
      t.integer "gallery_group",          limit: 1,   default: 0, null: false
      t.integer "gallery_rate",           limit: 1,   default: 0, null: false
      t.integer "dead",                   limit: 1,   default: 0, null: false
      t.string  "title",                  limit: 127
      t.string  "description",            limit: 255
      t.integer "thumbnail_clicks_count", limit: 4,   default: 0, null: false
      t.integer "timecode",               limit: 4
      t.string  "hardness",               limit: 4
    end

    add_index "media", ["media_type_id"], name: "fk_media_media_type", using: :btree
    add_index "media", ["source_media_id"], name: "source_media", using: :btree
    add_index "media", ["thumbnail_clicks_count", "ratings"], name: "sort_best", using: :btree
    add_index "media", ["timecode"], name: "timecode", using: :btree

  end
end
