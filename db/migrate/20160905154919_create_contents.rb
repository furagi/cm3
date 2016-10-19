class CreateContents < ActiveRecord::Migration
  def change
    create_table "content", primary_key: "content_id", force: :cascade do |t|
      t.integer "content_type_id",  limit: 4,                       null: false
      t.string  "content_name",     limit: 45
      t.integer "external_data",    limit: 4,   default: 0,         null: false
      t.string  "sef_name",         limit: 100, default: "content"
      t.integer "access_level",     limit: 4,   default: 100,       null: false
      t.integer "cm_sorting_index", limit: 4,   default: 0,         null: false
    end

    add_index "content", ["cm_sorting_index"], name: "cm_sorting_index", using: :btree
    add_index "content", ["content_id", "content_type_id", "sef_name"], name: "idx_for_cache_model_related_scenes", using: :btree
    add_index "content", ["content_type_id"], name: "fk_content_content_type", using: :btree
    add_index "content", ["external_data"], name: "in_external_data", using: :btree
    add_index "content", ["sef_name"], name: "sef_name", using: :btree
  end
end
