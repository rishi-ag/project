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

ActiveRecord::Schema[7.0].define(version: 2022_09_17_081753) do
  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "operator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["operator_id"], name: "index_clients_on_operator_id"
  end

  create_table "financed_invoices", force: :cascade do |t|
    t.float "deployed_amount"
    t.integer "investor_id"
    t.integer "invoice_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["investor_id"], name: "index_financed_invoices_on_investor_id"
    t.index ["invoice_id"], name: "index_financed_invoices_on_invoice_id"
  end

  create_table "investor_contracts", force: :cascade do |t|
    t.float "annualised_interest"
    t.float "non_utilised_interest"
    t.float "contract_amount"
    t.integer "investor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["investor_id"], name: "index_investor_contracts_on_investor_id"
  end

  create_table "investors", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.float "amount_deposited"
    t.float "amount_deployed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.float "total_amount"
    t.datetime "created_at", precision: nil
    t.datetime "goods_delivered_at", precision: nil
    t.datetime "goods_delivered_due_at", precision: nil
    t.boolean "is_goods_delivered"
    t.integer "client_id"
    t.integer "operator_id"
    t.index ["client_id"], name: "index_invoices_on_client_id"
    t.index ["operator_id"], name: "index_invoices_on_operator_id"
  end

  create_table "operator_client_contracts", force: :cascade do |t|
    t.integer "days_to_payment"
    t.integer "operator_id"
    t.integer "client_id"
    t.index ["client_id"], name: "index_operator_client_contracts_on_client_id"
    t.index ["operator_id"], name: "index_operator_client_contracts_on_operator_id"
  end

  create_table "operators", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "clients", "operators"
  add_foreign_key "financed_invoices", "investors"
  add_foreign_key "financed_invoices", "invoices"
  add_foreign_key "investor_contracts", "investors"
  add_foreign_key "invoices", "clients"
  add_foreign_key "invoices", "operators"
  add_foreign_key "operator_client_contracts", "clients"
  add_foreign_key "operator_client_contracts", "operators"
end
