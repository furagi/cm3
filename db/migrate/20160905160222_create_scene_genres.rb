class CreateSceneGenres < ActiveRecord::Migration
  def change
    create_table "scene_genre", primary_key: "scene_genre_id", force: :cascade do |t|
      t.integer "company_id",    limit: 4,              null: false
      t.string  "name",          limit: 45,             null: false
      t.string  "public",        limit: 1
      t.integer "external_data", limit: 4,              null: false
      # t.integer "content_id",    limit: 4
      t.integer "sweetness",     limit: 1,  default: 1, null: false
    end
    add_index "scene_genre", ["company_id"], name: "fk_scene_category_company", using: :btree
    # add_index "scene_genre", ["content_id"], name: "fk_scene_genre_content1", using: :btree
    add_index "scene_genre", ["external_data"], name: "in_external_data", using: :btree
  end
end
