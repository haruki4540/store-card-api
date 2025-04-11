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

ActiveRecord::Schema[8.0].define(version: 2025_04_10_145055) do
  create_table "member_cards", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "card_number", null: false
    t.string "card_name"
    t.date "issued_at"
    t.date "expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_number"], name: "index_member_cards_on_card_number", unique: true
    t.index ["user_id"], name: "index_member_cards_on_user_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name", null: false
    t.string "address"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_stores_on_name"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "member_card_id"
    t.integer "store_id"
    t.decimal "amount", precision: 10, scale: 2
    t.datetime "transaction_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_card_id"], name: "index_transactions_on_member_card_id"
    t.index ["store_id"], name: "index_transactions_on_store_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "password", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_type", default: "registered", null: false
    t.string "unique_code"
    t.string "phone_number"
    t.boolean "two_factor_enabled", default: false, null: false
    t.string "two_factor_secret"
    t.integer "coupon_balance", default: 0, null: false
    t.string "membership_number"
    t.string "furigana", default: "", null: false
    t.date "birth_date", default: "1900-01-01", null: false
    t.integer "gender", limit: 4, default: 0, null: false
    t.string "password_digest"
    t.string "email_confirm_token"
    t.datetime "confirmed_at", precision: nil
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["unique_code"], name: "index_users_on_unique_code", unique: true
  end

  add_foreign_key "member_cards", "users"
  add_foreign_key "transactions", "member_cards"
  add_foreign_key "transactions", "stores"
  add_foreign_key "transactions", "users"
end
