class CreateGtfUploadExtensions < ActiveRecord::Migration
  def change
    create_table "upload_extension", primary_key: "upload_extension_id", force: :cascade do |t|
      t.string "name",        limit: 10, null: false
      t.string "description", limit: 45, null: false
    end
  end
end
