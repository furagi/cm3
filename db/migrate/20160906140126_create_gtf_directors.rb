class CreateGtfDirectors < ActiveRecord::Migration
  def change
    create_table "director", primary_key: "director_id", force: :cascade do |t|
      t.integer "company_id", limit: 4,  null: false
      # t.integer "content_id", limit: 4,  null: false
      t.string  "name",       limit: 30, null: false
      t.string  "public",     limit: 1,  null: false
    end

    add_index "director", ["company_id"], name: "fk_director_company", using: :btree
    # add_index "director", ["content_id"], name: "content_id", unique: true, using: :btree
    # add_index "director", ["content_id"], name: "fk_director_content", using: :btree
  end
end
