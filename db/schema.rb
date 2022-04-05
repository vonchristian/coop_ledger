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

ActiveRecord::Schema[7.0].define(version: 2022_03_31_091832) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_categories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "account_type", null: false
    t.string "code", null: false
    t.boolean "contra", default: true
    t.uuid "office_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ancestry"
    t.index ["account_type"], name: "index_account_categories_on_account_type"
    t.index ["ancestry"], name: "index_account_categories_on_ancestry"
    t.index ["office_id"], name: "index_account_categories_on_office_id"
  end

  create_table "account_category_running_balances", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "account_category_id", null: false
    t.uuid "entry_id"
    t.date "recording_date"
    t.time "recording_time"
    t.integer "amount_cents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_category_id", "entry_id"], name: "index_account_catrunning_bals_on_account_cat_id_and_entry_id", unique: true
    t.index ["account_category_id"], name: "index_account_category_running_balances_on_account_category_id"
    t.index ["entry_id"], name: "index_account_category_running_balances_on_entry_id"
  end

  create_table "account_running_balances", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "account_id", null: false
    t.uuid "entry_id"
    t.date "recording_date"
    t.time "recording_time"
    t.integer "amount_cents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id", "entry_id"], name: "index_account_running_balances_on_account_id_and_entry_id", unique: true
    t.index ["account_id"], name: "index_account_running_balances_on_account_id"
    t.index ["entry_id"], name: "index_account_running_balances_on_entry_id"
  end

  create_table "accounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "account_type", null: false
    t.string "code", null: false
    t.boolean "contra", default: false
    t.uuid "office_id", null: false
    t.uuid "account_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_category_id"], name: "index_accounts_on_account_category_id"
    t.index ["account_type"], name: "index_accounts_on_account_type"
    t.index ["office_id"], name: "index_accounts_on_office_id"
  end

  create_table "cooperatives", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "abbreviated_name", null: false
    t.string "registration_number"
    t.string "contact_number"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "credit_amounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "entry_id", null: false
    t.integer "amount_cents"
    t.uuid "account_id", null: false
    t.date "recording_date", null: false
    t.timestamptz "recording_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_credit_amounts_on_account_id"
    t.index ["entry_id"], name: "index_credit_amounts_on_entry_id"
  end

  create_table "debit_amounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "entry_id", null: false
    t.integer "amount_cents"
    t.uuid "account_id", null: false
    t.date "recording_date", null: false
    t.timestamptz "recording_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_debit_amounts_on_account_id"
    t.index ["entry_id"], name: "index_debit_amounts_on_entry_id"
  end

  create_table "employees", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.uuid "office_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["office_id"], name: "index_employees_on_office_id"
  end

  create_table "entries", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "description"
    t.string "reference_number"
    t.uuid "office_id", null: false
    t.date "recording_date", null: false
    t.time "recording_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["office_id"], name: "index_entries_on_office_id"
  end

  create_table "offices", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "office_type", null: false
    t.string "name", null: false
    t.string "address"
    t.string "contact_number"
    t.uuid "cooperative_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cooperative_id"], name: "index_offices_on_cooperative_id"
    t.index ["office_type"], name: "index_offices_on_office_type"
  end

  add_foreign_key "account_categories", "offices"
  add_foreign_key "account_category_running_balances", "account_categories"
  add_foreign_key "account_category_running_balances", "entries"
  add_foreign_key "account_running_balances", "accounts"
  add_foreign_key "account_running_balances", "entries"
  add_foreign_key "accounts", "account_categories"
  add_foreign_key "accounts", "offices"
  add_foreign_key "credit_amounts", "accounts"
  add_foreign_key "credit_amounts", "entries"
  add_foreign_key "debit_amounts", "accounts"
  add_foreign_key "debit_amounts", "entries"
  add_foreign_key "employees", "offices"
  add_foreign_key "entries", "offices"
  add_foreign_key "offices", "cooperatives"
end
