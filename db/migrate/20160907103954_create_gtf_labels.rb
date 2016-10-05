class CreateGtfLabels < ActiveRecord::Migration
  def change
    create_table "label", primary_key: "label_id", force: :cascade do |t|
      t.integer "company_id",            limit: 4,                       null: false
      # t.integer "content_id",            limit: 4,                       null: false
      t.string  "code",                  limit: 20,                      null: false
      t.string  "name",                  limit: 45,                      null: false
      t.string  "description",           limit: 60,                      null: false
      t.integer "days_for_free_release", limit: 4
      t.integer "external_data",         limit: 4,                       null: false
      t.integer "sort",                  limit: 4,   default: 0,         null: false
      t.string  "provide_scenes",        limit: 3,   default: "no",      null: false
      t.string  "forum_thread_url",      limit: 256
      t.string  "status",                limit: 8,   default: "enabled", null: false
    end

    add_index "label", ["company_id"], name: "fk_label_company", using: :btree
    # add_index "label", ["content_id"], name: "content_id", unique: true, using: :btree

  end
end
