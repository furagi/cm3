class CreateSharedCountries < ActiveRecord::Migration
  def change
    create_table "country", primary_key: "country_id", force: :cascade do |t|
      t.string  "code",           limit: 3,                    null: false
      t.string  "name",           limit: 50,                   null: false
      t.string  "enabled",        limit: 1,                    null: false
      t.string  "select_default", limit: 1,                    null: false
      t.string  "region",         limit: 7,  default: "other"
      t.integer "currency_id",    limit: 4
      t.integer "risk_level",     limit: 2
    end

    add_index "country", ["code"], name: "code_UNIQUE", unique: true, using: :btree
    add_index "country", ["currency_id"], name: "currency_id", using: :btree
  end
end
