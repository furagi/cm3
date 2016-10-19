class CreateContentTypes < ActiveRecord::Migration
  def change
    create_table "content_type", primary_key: "content_type_id", force: :cascade do |t|
      t.string "name",     limit: 20, null: false
      t.string "constant", limit: 45, null: false
    end
  end
end
