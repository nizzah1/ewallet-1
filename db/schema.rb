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

ActiveRecord::Schema.define(version: 2018_08_17_180502) do

  create_table "commissions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "transfer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["transfer_id"], name: "index_commissions_on_transfer_id"
  end

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "authentication_token", limit: 30
    t.index ["authentication_token"], name: "index_customers_on_authentication_token", unique: true
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "transfers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "wallet_id"
    t.decimal "tr_cantidad", precision: 16, scale: 2, default: "0.0"
    t.integer "enviado_a"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wallet_id"], name: "index_transfers_on_wallet_id"
  end

  create_table "wallets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.decimal "ingresos", precision: 16, scale: 2, default: "0.0"
    t.decimal "gastos", precision: 16, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_id"
    t.index ["customer_id"], name: "index_wallets_on_customer_id"
  end

  add_foreign_key "commissions", "transfers"
  add_foreign_key "transfers", "wallets"
  add_foreign_key "wallets", "customers"
end
