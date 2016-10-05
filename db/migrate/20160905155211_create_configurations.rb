class CreateConfigurations < ActiveRecord::Migration
  def change
    create_table "config", primary_key: "config_id", force: :cascade do |t|
      t.string "constant",    limit: 50,  null: false
      t.string "value",       limit: 100, null: false
      t.string "description", limit: 500, null: false
    end
  end
end
