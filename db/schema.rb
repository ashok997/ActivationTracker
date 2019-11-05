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

ActiveRecord::Schema.define(version: 2019_11_05_025423) do

  create_table "activations", force: :cascade do |t|
    t.integer "phone_number"
    t.integer "IMEI"
    t.integer "user_id", null: false
    t.integer "carrier_id", null: false
    t.integer "phone_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["carrier_id"], name: "index_activations_on_carrier_id"
    t.index ["phone_id"], name: "index_activations_on_phone_id"
    t.index ["user_id"], name: "index_activations_on_user_id"
  end

  create_table "carriers", force: :cascade do |t|
    t.string "name"
    t.integer "cost"
    t.integer "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "phones", force: :cascade do |t|
    t.string "model"
    t.string "manufacturer"
    t.string "storage"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "activations", "carriers"
  add_foreign_key "activations", "phones"
  add_foreign_key "activations", "users"
end
