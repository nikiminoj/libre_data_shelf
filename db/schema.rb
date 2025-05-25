# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_05_25_124517) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.bigint "company_id"
    t.bigint "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_cities_on_company_id"
    t.index ["region_id"], name: "index_cities_on_region_id"
  end

  create_table "commercial_networks", force: :cascade do |t|
    t.string "name"
    t.string "contact_name"
    t.string "contact_number"
    t.string "comment"
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_commercial_networks_on_company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.integer "capacity_yellow"
    t.integer "capacity_red"
    t.integer "notification_period_yellow"
    t.integer "notification_period_red"
    t.integer "notification_period_zen"
    t.integer "notification_period_temperature"
    t.integer "shelf_offline_timeout"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_countries_on_company_id"
  end

  create_table "model_logs", force: :cascade do |t|
    t.string "action"
    t.string "entity_name"
    t.bigint "entity_type"
    t.bigint "company_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action"], name: "index_model_logs_on_action"
    t.index ["company_id"], name: "index_model_logs_on_company_id"
    t.index ["entity_name"], name: "index_model_logs_on_entity_name"
    t.index ["entity_type"], name: "index_model_logs_on_entity_type"
    t.index ["user_id"], name: "index_model_logs_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "status", null: false
    t.text "message"
    t.datetime "read_at"
    t.datetime "deleted_at"
    t.bigint "notifiable_id"
    t.string "notifiable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_notifications_on_created_at"
    t.index ["deleted_at"], name: "index_notifications_on_deleted_at"
    t.index ["notifiable_id", "notifiable_type"], name: "index_notifications_on_notifiable_id_and_notifiable_type"
    t.index ["read_at"], name: "index_notifications_on_read_at"
    t.index ["updated_at"], name: "index_notifications_on_updated_at"
  end

  create_table "product_groups", force: :cascade do |t|
    t.bigint "company_id"
    t.string "name"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_product_groups_on_company_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "vendor_code"
    t.integer "unit_weight"
    t.integer "min_storage_temperature"
    t.integer "max_storage_temperature"
    t.integer "capacity_yellow"
    t.integer "capacity_red"
    t.bigint "company_id"
    t.bigint "product_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_products_on_company_id"
    t.index ["product_group_id"], name: "index_products_on_product_group_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.bigint "company_id"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_regions_on_company_id"
    t.index ["country_id"], name: "index_regions_on_country_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "shelf_daily_stats", force: :cascade do |t|
    t.bigint "shelf_id", null: false
    t.date "date"
    t.decimal "max_temperature", precision: 6, scale: 2
    t.decimal "min_temperature", precision: 6, scale: 2
    t.integer "product_count_decrement"
    t.decimal "weight", precision: 8, scale: 2
    t.integer "product_count_violation_count", default: 0
    t.integer "product_count_violation_duration"
    t.integer "temperature_violation_count", default: 0
    t.integer "temperature_violation_duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shelf_id"], name: "index_shelf_daily_stats_on_shelf_id"
  end

  create_table "shelf_stats", force: :cascade do |t|
    t.decimal "weight", precision: 8, scale: 2
    t.decimal "weight_percent", precision: 6, scale: 2
    t.integer "product_count"
    t.integer "product_count_real"
    t.boolean "temperature_violation"
    t.integer "timedelta"
    t.integer "weight_increment"
    t.integer "weight_decrement"
    t.bigint "shelf_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shelf_id"], name: "index_shelf_stats_on_shelf_id"
  end

  create_table "shelves", force: :cascade do |t|
    t.string "mac_address"
    t.integer "mac_weight"
    t.string "comment"
    t.bigint "company_id", null: false
    t.bigint "product_id"
    t.integer "last_shelf_stat"
    t.integer "refill_shelf_stat"
    t.integer "grap_shelf_stat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_shelves_on_company_id"
    t.index ["product_id"], name: "index_shelves_on_product_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "address"
    t.string "contact_name"
    t.string "contact_number"
    t.string "comment"
    t.time "open_at"
    t.time "close_at"
    t.integer "commercial_network"
    t.bigint "company_id", null: false
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_shops_on_city_id"
    t.index ["company_id"], name: "index_shops_on_company_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  create_table "users_shops", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "shop_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_users_shops_on_shop_id"
    t.index ["user_id"], name: "index_users_shops_on_user_id"
  end

  add_foreign_key "cities", "companies"
  add_foreign_key "cities", "regions"
  add_foreign_key "commercial_networks", "companies"
  add_foreign_key "countries", "companies"
  add_foreign_key "model_logs", "companies"
  add_foreign_key "model_logs", "users"
  add_foreign_key "product_groups", "companies"
  add_foreign_key "products", "companies"
  add_foreign_key "regions", "companies"
  add_foreign_key "regions", "countries"
  add_foreign_key "shelf_daily_stats", "shelves"
  add_foreign_key "shelf_stats", "shelves"
  add_foreign_key "shelves", "companies"
  add_foreign_key "shelves", "products"
  add_foreign_key "shops", "companies"
  add_foreign_key "users_shops", "shops"
  add_foreign_key "users_shops", "users"
end
