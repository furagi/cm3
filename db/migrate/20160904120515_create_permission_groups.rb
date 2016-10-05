class CreatePermissionGroups < ActiveRecord::Migration
  def change
    create_table "permission_group", primary_key: "permission_group_id", force: :cascade do |t|
      t.string "name",             limit: 45,                            null: false
      t.string "description",      limit: 255,                           null: false
      t.string "permission_scope", limit: 13,  default: "internal_user", null: false
    end
  end
end
