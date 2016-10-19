class CreateFileObjectTypeFamilies < ActiveRecord::Migration
  def change
    create_table "file_object_type_family", primary_key: "file_object_type_family_id", force: :cascade do |t|
      t.string "name",        limit: 30,  null: false
      t.string "constant",    limit: 45,  null: false
      t.string "description", limit: 100
      t.string "category",    limit: 11
    end

    add_index "file_object_type_family", ["file_object_type_family_id"], name: "file_object_type_family_id", unique: true, using: :btree
  end
end
