class CreateContentPriceRates < ActiveRecord::Migration
  def change
    create_table "content_price_rate", primary_key: "content_price_rate_id", force: :cascade do |t|
      t.integer "content_id",                limit: 4,                 null: false
      t.float   "rate",                      limit: 24,                null: false
      t.string  "is_free_for_members",       limit: 3,  default: "no", null: false
      t.string  "is_available_for_free_tkt", limit: 3,  default: "no", null: false
      t.integer "automatic",                 limit: 1,                 null: false
    end

    add_index "content_price_rate", ["content_id"], name: "content_id", unique: true, using: :btree

  end
end
