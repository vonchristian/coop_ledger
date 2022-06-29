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

ActiveRecord::Schema[7.0].define(version: 2022_05_14_011239) do
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
    t.uuid "entry_id", null: false
    t.date "recording_date", null: false
    t.timestamptz "recording_time", null: false
    t.bigint "amount_cents", null: false
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
    t.index ["recording_date"], name: "index_account_running_balances_on_recording_date"
    t.index ["recording_time"], name: "index_account_running_balances_on_recording_time"
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

  create_table "cash_disbursement_vouchers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "office_id", null: false
    t.uuid "employee_id", null: false
    t.string "reference_number", null: false
    t.text "description", null: false
    t.date "recording_date", null: false
    t.timestamptz "recording_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_cash_disbursement_vouchers_on_employee_id"
    t.index ["office_id"], name: "index_cash_disbursement_vouchers_on_office_id"
    t.index ["reference_number"], name: "index_cash_disbursement_vouchers_on_reference_number"
  end

  create_table "cash_receipt_vouchers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "office_id", null: false
    t.uuid "employee_id", null: false
    t.string "reference_number", null: false
    t.text "description", null: false
    t.date "recording_date", null: false
    t.timestamptz "recording_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_cash_receipt_vouchers_on_employee_id"
    t.index ["office_id"], name: "index_cash_receipt_vouchers_on_office_id"
    t.index ["reference_number"], name: "index_cash_receipt_vouchers_on_reference_number"
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
    t.bigint "amount_cents", null: false
    t.uuid "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_credit_amounts_on_account_id"
    t.index ["entry_id"], name: "index_credit_amounts_on_entry_id"
  end

  create_table "debit_amounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "entry_id", null: false
    t.bigint "amount_cents", null: false
    t.uuid "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_debit_amounts_on_account_id"
    t.index ["entry_id"], name: "index_debit_amounts_on_entry_id"
  end

  create_table "employee_cash_accounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "account_id", null: false
    t.uuid "employee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_employee_cash_accounts_on_account_id"
    t.index ["employee_id"], name: "index_employee_cash_accounts_on_employee_id"
  end

  create_table "employee_entries", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "entry_id", null: false
    t.uuid "employee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_employee_entries_on_employee_id"
    t.index ["entry_id"], name: "index_employee_entries_on_entry_id"
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
    t.date "recording_date", null: false
    t.timestamptz "recording_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "membership_applications", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "membership_category_id", null: false
    t.uuid "cooperative_id", null: false
    t.string "first_name", null: false
    t.string "middle_name", null: false
    t.string "last_name", null: false
    t.integer "date_of_birth_day", null: false
    t.integer "date_of_birth_month", null: false
    t.integer "date_of_birth_year", null: false
    t.string "email"
    t.string "phone_number"
    t.string "civil_status", null: false
    t.string "sex", null: false
    t.string "reference_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["civil_status"], name: "index_membership_applications_on_civil_status"
    t.index ["cooperative_id"], name: "index_membership_applications_on_cooperative_id"
    t.index ["email"], name: "index_membership_applications_on_email", unique: true
    t.index ["membership_category_id"], name: "index_membership_applications_on_membership_category_id"
    t.index ["reference_number"], name: "index_membership_applications_on_reference_number", unique: true
    t.index ["sex"], name: "index_membership_applications_on_sex"
  end

  create_table "membership_categories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "cooperative_id", null: false
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cooperative_id"], name: "index_membership_categories_on_cooperative_id"
  end

  create_table "memberships", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "member_id", null: false
    t.uuid "cooperative_id", null: false
    t.uuid "membership_category_id", null: false
    t.date "approval_date"
    t.date "application_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cooperative_id"], name: "index_memberships_on_cooperative_id"
    t.index ["member_id"], name: "index_memberships_on_member_id"
    t.index ["membership_category_id"], name: "index_memberships_on_membership_category_id"
  end

  create_table "office_entries", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "office_id", null: false
    t.uuid "entry_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entry_id"], name: "index_office_entries_on_entry_id"
    t.index ["office_id"], name: "index_office_entries_on_office_id"
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

  create_table "people", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "first_name", null: false
    t.string "middle_name", null: false
    t.string "last_name", null: false
    t.integer "date_of_birth_day", null: false
    t.integer "date_of_birth_month", null: false
    t.integer "date_of_birth_year", null: false
    t.string "email"
    t.string "phone_number"
    t.string "civil_status", null: false
    t.string "sex", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["civil_status"], name: "index_people_on_civil_status"
    t.index ["email"], name: "index_people_on_email", unique: true
    t.index ["sex"], name: "index_people_on_sex"
  end

  create_table "personal_saving_applications", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "depositor_id", null: false
    t.uuid "saving_product_id", null: false
    t.uuid "liability_account_id", null: false
    t.uuid "interest_account_id", null: false
    t.uuid "office_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["depositor_id"], name: "index_personal_saving_applications_on_depositor_id"
    t.index ["interest_account_id"], name: "index_personal_saving_applications_on_interest_account_id"
    t.index ["liability_account_id"], name: "index_personal_saving_applications_on_liability_account_id"
    t.index ["office_id"], name: "index_personal_saving_applications_on_office_id"
    t.index ["saving_product_id"], name: "index_personal_saving_applications_on_saving_product_id"
  end

  create_table "personal_savings", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "depositor_id", null: false
    t.uuid "saving_product_id", null: false
    t.uuid "liability_account_id", null: false
    t.uuid "interest_account_id", null: false
    t.uuid "office_id", null: false
    t.date "opening_date"
    t.date "closing_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["closing_date"], name: "index_personal_savings_on_closing_date"
    t.index ["depositor_id"], name: "index_personal_savings_on_depositor_id"
    t.index ["interest_account_id"], name: "index_personal_savings_on_interest_account_id"
    t.index ["liability_account_id"], name: "index_personal_savings_on_liability_account_id"
    t.index ["office_id"], name: "index_personal_savings_on_office_id"
    t.index ["opening_date"], name: "index_personal_savings_on_opening_date"
    t.index ["saving_product_id"], name: "index_personal_savings_on_saving_product_id"
  end

  create_table "saving_products", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "cooperative_id", null: false
    t.string "name", null: false
    t.string "description", null: false
    t.boolean "interest_earning", default: false, null: false
    t.decimal "interest_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cooperative_id"], name: "index_saving_products_on_cooperative_id"
  end

  create_table "voucher_credit_amounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "amount_cents", null: false
    t.uuid "account_id", null: false
    t.uuid "voucher_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_voucher_credit_amounts_on_account_id"
    t.index ["voucher_id"], name: "index_voucher_credit_amounts_on_voucher_id"
  end

  create_table "voucher_debit_amounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "amount_cents", null: false
    t.uuid "account_id", null: false
    t.uuid "voucher_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_voucher_debit_amounts_on_account_id"
    t.index ["voucher_id"], name: "index_voucher_debit_amounts_on_voucher_id"
  end

  add_foreign_key "account_categories", "offices"
  add_foreign_key "account_category_running_balances", "account_categories"
  add_foreign_key "account_category_running_balances", "entries"
  add_foreign_key "account_running_balances", "accounts"
  add_foreign_key "account_running_balances", "entries"
  add_foreign_key "accounts", "account_categories"
  add_foreign_key "accounts", "offices"
  add_foreign_key "cash_disbursement_vouchers", "employees"
  add_foreign_key "cash_disbursement_vouchers", "offices"
  add_foreign_key "cash_receipt_vouchers", "employees"
  add_foreign_key "cash_receipt_vouchers", "offices"
  add_foreign_key "credit_amounts", "accounts"
  add_foreign_key "credit_amounts", "entries"
  add_foreign_key "debit_amounts", "accounts"
  add_foreign_key "debit_amounts", "entries"
  add_foreign_key "employee_cash_accounts", "accounts"
  add_foreign_key "employee_cash_accounts", "employees"
  add_foreign_key "employee_entries", "employees"
  add_foreign_key "employee_entries", "entries"
  add_foreign_key "employees", "offices"
  add_foreign_key "membership_applications", "cooperatives"
  add_foreign_key "membership_applications", "membership_categories"
  add_foreign_key "membership_categories", "cooperatives"
  add_foreign_key "memberships", "cooperatives"
  add_foreign_key "memberships", "membership_categories"
  add_foreign_key "memberships", "people", column: "member_id"
  add_foreign_key "office_entries", "entries"
  add_foreign_key "office_entries", "offices"
  add_foreign_key "offices", "cooperatives"
  add_foreign_key "personal_saving_applications", "accounts", column: "interest_account_id"
  add_foreign_key "personal_saving_applications", "accounts", column: "liability_account_id"
  add_foreign_key "personal_saving_applications", "offices"
  add_foreign_key "personal_saving_applications", "people", column: "depositor_id"
  add_foreign_key "personal_saving_applications", "saving_products"
  add_foreign_key "personal_savings", "accounts", column: "interest_account_id"
  add_foreign_key "personal_savings", "accounts", column: "liability_account_id"
  add_foreign_key "personal_savings", "offices"
  add_foreign_key "personal_savings", "people", column: "depositor_id"
  add_foreign_key "personal_savings", "saving_products"
  add_foreign_key "saving_products", "cooperatives"
  add_foreign_key "voucher_credit_amounts", "accounts"
  add_foreign_key "voucher_debit_amounts", "accounts"
end
