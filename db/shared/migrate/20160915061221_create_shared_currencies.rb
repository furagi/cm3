class CreateSharedCurrencies < ActiveRecord::Migration
  def change
    create_table "currency", primary_key: "currency_id", force: :cascade do |t|
      t.string   "sign",                       limit: 4,  null: false
      t.string   "unicode_sign",               limit: 4,  null: false
      t.string   "name",                       limit: 40, null: false
      t.string   "code",                       limit: 4,  null: false
      t.integer  "numeric_code",               limit: 4,  null: false
      t.float    "exchange_rate",              limit: 24, null: false
      t.string   "apply_exchange_rate",        limit: 3,  null: false
      t.string   "update_exchange_rate",       limit: 3,  null: false
      t.string   "primary",                    limit: 1,  null: false
      t.integer  "rounding",                   limit: 4,  null: false
      t.datetime "last_exchange_rate_dynamic"
    end

    add_index "currency", ["code"], name: "code_UNIQUE", unique: true, using: :btree

  end
end
