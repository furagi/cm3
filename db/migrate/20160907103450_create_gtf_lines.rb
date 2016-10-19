class CreateGtfLines < ActiveRecord::Migration
  def change
    create_table "line", primary_key: "line_id", force: :cascade do |t|
      t.integer "label_id",             limit: 4,                        null: false
      t.integer "company_id",           limit: 4,                        null: false
      t.integer "content_id",           limit: 4,                        null: false
      t.string  "code",                 limit: 20,                       null: false
      t.string  "name",                 limit: 128,                      null: false
      t.string  "description",          limit: 100,                      null: false
      t.integer "external_data",        limit: 4,                        null: false
      t.string  "direction",            limit: 8,   default: "straight", null: false
      t.boolean "should_be_verimarked", limit: 1,   default: false,      null: false
    end

    add_index "line", ["company_id"], name: "fk_line_company", using: :btree
    add_index "line", ["content_id"], name: "fk_line_content", unique: true, using: :btree
    add_index "line", ["label_id"], name: "fk_line_label", using: :btree

  end
end
