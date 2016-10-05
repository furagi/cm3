class CreateCompanies < ActiveRecord::Migration
  def change
    create_table "company", primary_key: "company_id", force: :cascade do |t|
      t.string  "name",                limit: 50, null: false
      t.string  "description",         limit: 80, null: false
      t.string  "address_1",           limit: 50
      t.string  "address_2",           limit: 50
      t.string  "address_city",        limit: 50
      t.string  "address_postcode",    limit: 50
      t.string  "address_state",       limit: 50
      t.string  "address_country",     limit: 50
      t.integer "tech_contact_id",     limit: 4
      t.integer "business_contact_id", limit: 4
    end
  end
end
