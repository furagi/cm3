class CreateAgents < ActiveRecord::Migration
  def change
    create_table "agent", primary_key: "agent_id", force: :cascade do |t|
      t.integer "company_id", limit: 4,  null: false
      t.string  "name",       limit: 40, null: false
      t.string  "mobile",     limit: 30, null: false
      t.string  "email",      limit: 30, null: false
    end

    add_index "agent", ["company_id"], name: "fk_agent_company", using: :btree

  end
end
