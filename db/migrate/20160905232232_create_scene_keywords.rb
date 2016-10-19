class CreateSceneKeywords < ActiveRecord::Migration
  def change
    create_table "scene_keywords", primary_key: "scene_keywords_id", force: :cascade do |t|
      t.integer "company_id", limit: 4,   null: false
      t.string  "name",       limit: 250, null: false
      t.string  "public",     limit: 1
    end

    add_index "scene_keywords", ["company_id"], name: "fk_scene_keywords_company", using: :btree
  end
end
