class CreateGtfEncoderServers < ActiveRecord::Migration
  def change
    create_table "encoder_server", primary_key: "encoder_server_id", force: :cascade do |t|
      t.string "name",        limit: 20,                  null: false
      t.string "description", limit: 200,                 null: false
      t.string "status",      limit: 4,                   null: false
      t.string "is_usable",   limit: 3,   default: "yes", null: false
    end
  end
end
