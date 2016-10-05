class CreateModels < ActiveRecord::Migration
  def change
    create_table "model", primary_key: "model_id", force: :cascade do |t|
      t.integer  "agent_id",            limit: 4
      t.integer  "company_id",          limit: 4,                 null: false
      t.integer  "content_id",          limit: 4
      t.integer  "country_id",          limit: 4,                 null: false
      t.integer  "model_status_id",     limit: 4
      t.string   "public",              limit: 1,   default: "1", null: false
      t.datetime "created",                                       null: false
      t.datetime "birth_date"
      t.integer  "first_debute",        limit: 4
      t.string   "first_name",          limit: 30,                null: false
      t.string   "middle_name",         limit: 30,                null: false
      t.string   "last_name",           limit: 30,                null: false
      t.string   "name",                limit: 45,                null: false
      t.string   "city",                limit: 30,                null: false
      t.string   "mobile",              limit: 30,                null: false
      t.string   "email",               limit: 30,                null: false
      t.string   "description",         limit: 30,                null: false
      t.string   "sex",                 limit: 6
      t.string   "bust_size",           limit: 1
      t.string   "hair_color",          limit: 6
      t.string   "hair_length",         limit: 6
      t.string   "height",              limit: 3
      t.string   "weight",              limit: 2
      t.string   "shoe",                limit: 2
      t.string   "race",                limit: 8
      t.string   "work_rating",         limit: 2
      t.string   "payment",             limit: 5
      t.string   "skin_color",          limit: 5
      t.string   "source_url",          limit: 512,               null: false
      t.datetime "source_last_updated"
      t.integer  "external_data",       limit: 4,   default: 0,   null: false
      t.string   "forum_thread_url",    limit: 256
      t.integer  "user_id",             limit: 4,                 null: false
    end

    add_index "model", ["agent_id"], name: "fk_model_agent", using: :btree
    add_index "model", ["company_id"], name: "fk_model_company", using: :btree
    add_index "model", ["content_id", "model_id"], name: "fk_model_content", using: :btree
    add_index "model", ["content_id"], name: "content_id", unique: true, using: :btree
    add_index "model", ["country_id"], name: "fk_model_country", using: :btree
    add_index "model", ["external_data"], name: "in_external_data", using: :btree
    add_index "model", ["user_id"], name: "fk_model_user", using: :btree

  end
end
