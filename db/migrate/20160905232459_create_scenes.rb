class CreateScenes < ActiveRecord::Migration
  def change
    create_table "scene", primary_key: "scene_id", force: :cascade do |t|
      t.integer  "user_id",                  limit: 4,                                             null: false
      t.integer  "editor_id",                limit: 4
      t.integer  "company_id",               limit: 4,                                             null: false
      t.integer  "content_id",               limit: 4,                                             null: false
      t.integer  "line_id",                  limit: 4,                                             null: false
      t.integer  "director_id",              limit: 4,                                             null: false
      # t.integer  "studio_id",                limit: 4
      # t.integer  "link_scene_status_id",     limit: 4
      t.datetime "created",                                                                        null: false
      t.string   "tape",                     limit: 20
      t.string   "director_rating",          limit: 2
      t.string   "director_comment",         limit: 100
      t.string   "seo_title",                limit: 128
      t.string   "small_description",        limit: 200,                                           null: false
      t.string   "big_description",          limit: 400,                                           null: false
      t.text     "keywords",                 limit: 65535
      t.text     "talents",                  limit: 65535
      t.string   "bts_description",          limit: 400
      t.string   "behind_info",              limit: 400,                                           null: false
      t.date     "date_of_production"
      t.time     "runtime"
      t.integer  "cost",                     limit: 4,                                             null: false
      t.decimal  "sales_at_day_100",                       precision: 8, scale: 2,                 null: false
      t.decimal  "sales_at_day_547",                       precision: 8, scale: 2,                 null: false
      t.string   "name",                     limit: 128,                                           null: false
      t.integer  "external_data",            limit: 4,                             default: 0,     null: false
      t.boolean  "need_to_extract_metadata", limit: 1,                             default: false, null: false
    end

    add_index "scene", ["company_id"], name: "fk_scene_company", using: :btree
    add_index "scene", ["content_id", "scene_id", "name"], name: "content_id", unique: true, using: :btree
    add_index "scene", ["content_id"], name: "fk_scene_content", unique: true, using: :btree
    add_index "scene", ["director_id"], name: "fk_scene_director", using: :btree
    add_index "scene", ["external_data"], name: "in_external_data", using: :btree
    add_index "scene", ["line_id"], name: "fk_scene_line", using: :btree
    add_index "scene", ["scene_id", "name"], name: "idx_for_cache_model_related_scenes", using: :btree
    # add_index "scene", ["studio_id"], name: "fk_scene_studio", using: :btree
    add_index "scene", ["user_id"], name: "fk_scene_user", using: :btree
  end
end
