# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_29_153735) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ganjas", force: :cascade do |t|
    t.string "name"
    t.string "strain"
    t.text "description"
    t.float "unit_price"
    t.string "type"
    t.string "pickup_local"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_ganjas_on_user_id"
  end

  create_table "purchase_requests", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "ganja_id", null: false
    t.string "status"
    t.string "pickup_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ganja_id"], name: "index_purchase_requests_on_ganja_id"
    t.index ["user_id"], name: "index_purchase_requests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "ganjas", "users"
  add_foreign_key "purchase_requests", "ganjas"
  add_foreign_key "purchase_requests", "users"
end
