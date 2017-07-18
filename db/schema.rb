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

ActiveRecord::Schema.define(version: 20170718053513) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.decimal  "opening_cash",                       precision: 12, scale: 2
    t.decimal  "opening_bank",                       precision: 12, scale: 2
    t.integer  "user_id"
    t.string   "bank"
    t.json     "image"
    t.decimal  "cash_collection_amount",             precision: 12, scale: 2
    t.string   "cash_collection_description"
    t.decimal  "cash_purchase_amount",               precision: 12, scale: 2
    t.string   "cash_purchase_description"
    t.decimal  "credit_purchase_amount",             precision: 12, scale: 2
    t.string   "credit_purchase_description"
    t.string   "creditor_name"
    t.decimal  "payment_creditor_cash_amount",       precision: 12, scale: 2
    t.string   "payment_creditor_cash_description"
    t.decimal  "payment_creditor_bank_amount",       precision: 12, scale: 2
    t.string   "payment_creditor_bank_description"
    t.decimal  "card_collection_amount",             precision: 12, scale: 2
    t.string   "card_collection_description"
    t.integer  "card_charges"
    t.decimal  "bank_transfer_amount",               precision: 12, scale: 2
    t.string   "bank_transfer_description"
    t.decimal  "fpx_collection_amount",              precision: 12, scale: 2
    t.string   "fpx_collection_description"
    t.decimal  "fpx_charges",                        precision: 6,  scale: 2
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
    t.string   "open_cash_description"
    t.string   "recurring_payment"
    t.string   "recurring_payment_description"
    t.decimal  "recurring_payment_amount",           precision: 12, scale: 2
    t.string   "recurring_payment_bank"
    t.string   "recurring_payment_bank_description"
    t.decimal  "recurring_payment_bank_amount",      precision: 12, scale: 2
    t.decimal  "depreciation_cash",                  precision: 8,  scale: 2
    t.string   "asset_purchase_cash"
    t.string   "asset_purchase_cash_description"
    t.decimal  "asset_purchase_cash_amount",         precision: 12, scale: 2
    t.decimal  "depreciation_bank",                  precision: 8,  scale: 2
    t.string   "asset_purchase_bank"
    t.string   "asset_purchase_bank_description"
    t.decimal  "asset_purchase_bank_amount",         precision: 12, scale: 2
    t.decimal  "closing_inventory",                  precision: 12, scale: 2
  end

  create_table "income_taxes", force: :cascade do |t|
    t.string   "title"
    t.decimal  "amount",      precision: 12, scale: 2
    t.string   "description"
    t.json     "image"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "user_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.decimal  "price",       precision: 8, scale: 2
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "user_id"
    t.json     "image"
  end

  create_table "offers", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.decimal  "price",       precision: 8, scale: 2
    t.integer  "user_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.json     "image"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "list_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "full_name"
    t.string   "business_type"
    t.string   "address"
    t.string   "company_name"
    t.integer  "company_no"
    t.boolean  "superadmin",             default: false
    t.boolean  "merchant",               default: false
    t.boolean  "normal",                 default: true
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
