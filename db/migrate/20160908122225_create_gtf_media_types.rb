class CreateGtfMediaTypes < ActiveRecord::Migration
  def change
    create_table "media_type", primary_key: "media_type_id", force: :cascade do |t|
      t.string "name",     limit: 45, null: false
      t.string "constant", limit: 45, null: false
    end

  end
end
