class CreateSharedWebsites < ActiveRecord::Migration
  def change
    create_table "website", primary_key: "website_id", force: :cascade do |t|
        # t.integer "content_id",              limit: 4,                         null: false
        t.string  "shortname",               limit: 45
        t.string  "shortcode",               limit: 2
        t.string  "name",                    limit: 30,                        null: false
        t.string  "description",             limit: 45,                        null: false
        t.string  "url",                     limit: 70,                        null: false
        t.string  "logo",                    limit: 50
        t.string  "main_gallery_page",       limit: 45
        t.string  "registration_enabled",    limit: 12,    default: "no",      null: false
        t.string  "template_class",          limit: 45
        t.string  "delegated_login_enabled", limit: 1,     default: "0",       null: false
        t.string  "type",                    limit: 8,     default: "paysite", null: false
        t.string  "is_active",               limit: 3,     default: "yes",     null: false
        t.string  "use_by_landing_pages",    limit: 3,     default: "no",      null: false
        t.text    "json_params",             limit: 65535
        t.string  "constant",                limit: 45,                        null: false
        t.string  "watermark",               limit: 45
        t.string  "status",                  limit: 8,     default: "active",  null: false
      end

      add_index "website", ["constant"], name: "idx_constant_unique", unique: true, using: :btree
      # add_index "website", ["content_id"], name: "content_id", using: :btree
  end
end
