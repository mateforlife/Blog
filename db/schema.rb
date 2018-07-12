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

ActiveRecord::Schema.define(version: 20180712191219) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "visits_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "cover_file_name"
    t.string "cover_content_type"
    t.integer "cover_file_size"
    t.datetime "cover_updated_at"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "article_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_comments_on_article_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "doors", force: :cascade do |t|
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "has_categories", force: :cascade do |t|
    t.integer "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.index ["article_id"], name: "index_has_categories_on_article_id"
    t.index ["category_id"], name: "index_has_categories_on_category_id"
  end

  create_table "locations", force: :cascade do |t|
    t.integer "slot"
    t.integer "level"
    t.boolean "available", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_id"
    t.string "passage"
    t.index ["product_id"], name: "index_locations_on_product_id"
  end

  create_table "operations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pallet_locations", force: :cascade do |t|
    t.bigint "pallet_id"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_pallet_locations_on_location_id"
    t.index ["pallet_id"], name: "index_pallet_locations_on_pallet_id"
  end

  create_table "pallets", force: :cascade do |t|
    t.bigint "reception_id"
    t.string "pallet_number"
    t.integer "origin_qty"
    t.integer "reserved_qty"
    t.integer "available_qty"
    t.date "exp_date"
    t.string "batch"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_id"
    t.date "elab_date"
    t.index ["product_id"], name: "index_pallets_on_product_id"
    t.index ["reception_id"], name: "index_pallets_on_reception_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "code"
    t.string "description"
    t.string "client_code"
    t.integer "innerpack"
    t.string "ean13"
    t.string "dun14"
    t.string "aux_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "client_id"
    t.integer "layer"
    t.integer "layer_qty"
    t.index ["client_id"], name: "index_products_on_client_id"
  end

  create_table "receptions", force: :cascade do |t|
    t.bigint "scheduling_id"
    t.string "document_number"
    t.string "origin_place"
    t.string "vehicle_patent"
    t.string "reference_text"
    t.text "comment"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scheduling_id"], name: "index_receptions_on_scheduling_id"
    t.index ["user_id"], name: "index_receptions_on_user_id"
  end

  create_table "schedulings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "client_id"
    t.bigint "operation_id"
    t.string "observation"
    t.integer "pallets_qty"
    t.datetime "date"
    t.bigint "door_id"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_schedulings_on_client_id"
    t.index ["door_id"], name: "index_schedulings_on_door_id"
    t.index ["operation_id"], name: "index_schedulings_on_operation_id"
    t.index ["user_id"], name: "index_schedulings_on_user_id"
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
    t.string "name"
    t.string "permission_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "locations", "products"
  add_foreign_key "pallet_locations", "locations"
  add_foreign_key "pallet_locations", "pallets"
  add_foreign_key "pallets", "products"
  add_foreign_key "pallets", "receptions"
  add_foreign_key "products", "clients"
  add_foreign_key "receptions", "schedulings"
  add_foreign_key "schedulings", "clients"
  add_foreign_key "schedulings", "doors"
  add_foreign_key "schedulings", "operations"
end
