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

ActiveRecord::Schema.define(version: 2022_10_01_043054) do

  create_table "admins", force: :cascade do |t|
    t.string "admin_id"
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.index ["admin_id"], name: "index_admins_on_admin_id", unique: true
  end

  create_table "bags", force: :cascade do |t|
    t.float "weight"
    t.float "cost"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.integer "reservation_id", null: false
    t.index ["reservation_id"], name: "index_bags_on_reservation_id"
    t.index ["user_id"], name: "index_bags_on_user_id"
  end

  create_table "flights", force: :cascade do |t|
    t.string "name"
    t.string "flight_id"
    t.string "manufacturer"
    t.string "source"
    t.string "destination"
    t.decimal "capacity"
    t.string "status"
    t.float "cost"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "category"
    t.index ["flight_id"], name: "index_flights_on_flight_id", unique: true
  end

  create_table "reservations", force: :cascade do |t|
    t.decimal "passengers_num"
    t.string "confirmation_num"
    t.string "category"
    t.string "amenities"
    t.float "cost"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "bags_num"
    t.integer "user_id", null: false
    t.integer "flight_id", null: false
    t.index ["confirmation_num"], name: "index_reservations_on_confirmation_num", unique: true
    t.index ["flight_id"], name: "index_reservations_on_flight_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "card"
    t.string "address"
    t.string "mobile"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
  end

  add_foreign_key "bags", "reservations"
  add_foreign_key "bags", "users"
  add_foreign_key "reservations", "flights"
  add_foreign_key "reservations", "users"
end
