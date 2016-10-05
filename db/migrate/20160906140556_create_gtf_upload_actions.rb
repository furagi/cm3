class CreateGtfUploadActions < ActiveRecord::Migration
  def change
    create_table "upload_action", primary_key: "upload_action_id", force: :cascade do |t|
      t.string  "name",                     limit: 30,  null: false
      t.string  "constant",                 limit: 45,  null: false
      t.integer "media_type",               limit: 4,   null: false
      t.string  "display",                  limit: 1,   null: false
      t.string  "display_main",             limit: 1,   null: false
      t.string  "button_text",              limit: 20,  null: false
      t.string  "action_message",           limit: 100, null: false
      t.string  "action_duplicate_message", limit: 100, null: false
    end
  end
end
