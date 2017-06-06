# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170516012713) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_keys", force: :cascade do |t|
    t.string   "ak_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blocks", force: :cascade do |t|
    t.integer  "operator_id"
    t.integer  "developer_id"
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.jsonb    "district"
    t.index ["code"], name: "index_blocks_on_code", unique: true, using: :btree
    t.index ["developer_id"], name: "index_blocks_on_developer_id", using: :btree
    t.index ["operator_id"], name: "index_blocks_on_operator_id", using: :btree
  end

  create_table "categories", id: :string, force: :cascade do |t|
    t.string   "parent_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_categories_on_parent_id", using: :btree
  end

  create_table "cooperations", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "store_id"
    t.date     "start_date"
    t.integer  "status"
    t.text     "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_cooperations_on_service_id", using: :btree
    t.index ["store_id"], name: "index_cooperations_on_store_id", using: :btree
  end

  create_table "districts", id: :string, force: :cascade do |t|
    t.string   "parent_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_districts_on_parent_id", using: :btree
  end

  create_table "enterprises", force: :cascade do |t|
    t.integer  "developer_id"
    t.integer  "operator_id"
    t.string   "name"
    t.jsonb    "district"
    t.string   "address"
    t.string   "contact"
    t.string   "contact_position"
    t.text     "contact_otherinfo"
    t.text     "remarks"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "code"
    t.string   "contact_telephone"
    t.index ["code"], name: "index_enterprises_on_code", unique: true, using: :btree
  end

  create_table "oauth_access_grants", force: :cascade do |t|
    t.integer  "resource_owner_id", null: false
    t.integer  "application_id",    null: false
    t.string   "token",             null: false
    t.integer  "expires_in",        null: false
    t.text     "redirect_uri",      null: false
    t.datetime "created_at",        null: false
    t.datetime "revoked_at"
    t.string   "scopes"
    t.index ["token"], name: "index_oauth_access_grants_on_token", unique: true, using: :btree
  end

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id"
    t.string   "token",                               null: false
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",                          null: false
    t.string   "scopes"
    t.string   "previous_refresh_token", default: "", null: false
    t.index ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true, using: :btree
    t.index ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id", using: :btree
    t.index ["token"], name: "index_oauth_access_tokens_on_token", unique: true, using: :btree
  end

  create_table "oauth_applications", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "uid",                       null: false
    t.string   "secret",                    null: false
    t.text     "redirect_uri",              null: false
    t.string   "scopes",       default: "", null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["uid"], name: "index_oauth_applications_on_uid", unique: true, using: :btree
  end

  create_table "pictures", force: :cascade do |t|
    t.string   "imageable_type"
    t.integer  "imageable_id"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["imageable_type", "imageable_id"], name: "index_pictures_on_imageable_type_and_imageable_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
    t.index ["name"], name: "index_roles_on_name", using: :btree
  end

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.string   "company_name"
    t.jsonb    "district"
    t.string   "address"
    t.string   "contact"
    t.string   "contact_position"
    t.string   "contact_telephone"
    t.text     "contact_otherinfo"
    t.text     "remarks"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "stores", force: :cascade do |t|
    t.integer  "block_id"
    t.integer  "enterprise_id"
    t.integer  "developer_id"
    t.integer  "operator_id"
    t.jsonb    "category"
    t.jsonb    "district"
    t.string   "name"
    t.string   "address"
    t.string   "contact"
    t.string   "contact_position"
    t.text     "contact_otherinfo"
    t.text     "remarks"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "code"
    t.string   "product"
    t.string   "contact_telephone"
    t.index ["block_id"], name: "index_stores_on_block_id", using: :btree
    t.index ["code"], name: "index_stores_on_code", unique: true, using: :btree
    t.index ["developer_id"], name: "index_stores_on_developer_id", using: :btree
    t.index ["operator_id"], name: "index_stores_on_operator_id", using: :btree
  end

  create_table "towns", force: :cascade do |t|
    t.string   "name"
    t.integer  "district_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["district_id"], name: "index_towns_on_district_id", using: :btree
    t.index ["name"], name: "index_towns_on_name", using: :btree
  end

  create_table "trades", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "store_id"
    t.date     "date"
    t.integer  "trade_num"
    t.float    "trade_sum"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_trades_on_service_id", using: :btree
    t.index ["store_id"], name: "index_trades_on_store_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree
  end

  add_foreign_key "oauth_access_grants", "oauth_applications", column: "application_id"
  add_foreign_key "oauth_access_tokens", "oauth_applications", column: "application_id"
  add_foreign_key "stores", "blocks"
end
