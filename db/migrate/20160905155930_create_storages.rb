class CreateStorages < ActiveRecord::Migration
  def change
    create_table "storage", primary_key: "storage_id", force: :cascade do |t|
      t.integer "storage_priority",         limit: 4,                                    null: false
      t.string  "media_type",               limit: 5,                                    null: false
      t.string  "storage_url",              limit: 45,                                   null: false
      t.integer "subpath1_counter",         limit: 4,                                    null: false
      t.integer "subpath2_threshold",       limit: 4,                                    null: false
      t.integer "subpath2_counter",         limit: 4,                                    null: false
      t.integer "used_space_mb",            limit: 4,  default: 0,                       null: false
      t.integer "free_space_mb",            limit: 4,  default: 0,                       null: false
      t.integer "minimum_free_space_mb",    limit: 4,  default: 1000,                    null: false
      t.string  "status",                   limit: 7,  default: "free",                  null: false
      t.string  "licensing_memcache_queue", limit: 45, default: "encoder_v1_common_job", null: false
      t.string  "allow_encoding_on_demand", limit: 3,  default: "yes",                   null: false
    end
    add_index "storage", ["storage_id", "storage_url"], name: "idx_for_cache_model_related_scenes", using: :btree
  end
end
