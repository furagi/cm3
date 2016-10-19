class CreateGtfContentReleases < ActiveRecord::Migration
  def change
    create_table "content_release", primary_key: "content_release_id", force: :cascade do |t|
      t.integer  "website_id",          limit: 4,                    null: false
      t.integer  "content_id",          limit: 4,                    null: false
      t.datetime "date",                                             null: false
      t.integer  "views",               limit: 4,                    null: false
      t.integer  "paid_views",          limit: 4,  default: 0,       null: false
      t.integer  "last_week_views",     limit: 4,  default: 0,       null: false
      t.integer  "downloads",           limit: 4,                    null: false
      t.integer  "last_week_downloads", limit: 4,  default: 0,       null: false
      t.datetime "release_created",                                  null: false
      t.integer  "external_data",       limit: 4,                    null: false
      t.integer  "sorting_index",       limit: 4,  default: 0,       null: false
      t.integer  "ratings",             limit: 4,  default: 0,       null: false
      t.float    "average_rating",      limit: 24, default: 0.0,     null: false
      t.string   "created_by",          limit: 5,  default: "admin", null: false
    end

    add_index "content_release", ["content_id", "website_id", "content_release_id"], name: "idx_for_cache_model_related_scenes", using: :btree
    add_index "content_release", ["content_id"], name: "fk_content_release_content", using: :btree
    add_index "content_release", ["external_data"], name: "in_external_data", using: :btree
    add_index "content_release", ["website_id", "content_id"], name: "unique_release_on_site", unique: true, using: :btree
    add_index "content_release", ["website_id"], name: "fk_content_release_website", using: :btree
  end
end
