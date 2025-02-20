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

ActiveRecord::Schema[8.0].define(version: 2025_02_20_152015) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expressways", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routes", force: :cascade do |t|
    t.bigint "expressway_id", null: false
    t.bigint "origin_id", null: false
    t.bigint "destination_id", null: false
    t.decimal "toll_fee", precision: 10, scale: 2, null: false
    t.integer "vehicle_class", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destination_id"], name: "index_routes_on_destination_id"
    t.index ["expressway_id", "origin_id", "destination_id", "vehicle_class"], name: "idx_routes_on_expressway_cities_and_class", unique: true
    t.index ["expressway_id"], name: "index_routes_on_expressway_id"
    t.index ["origin_id"], name: "index_routes_on_origin_id"
  end

  add_foreign_key "routes", "cities", column: "destination_id"
  add_foreign_key "routes", "cities", column: "origin_id"
  add_foreign_key "routes", "expressways"
end
