
ActiveRecord::Schema[7.0].define(version: 2023_05_24_074126) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "phone_number"
    t.string "avatar_url"
    t.string "name"
    t.integer "id_number"
    t.integer "account_number"
    t.bigint "user_id"
    t.string "agent_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_number"], name: "index_accounts_on_account_number", unique: true
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "agents", primary_key: "agent_number", id: :string, force: :cascade do |t|
    t.integer "slots", default: 0
    t.string "name"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_agents_on_account_id"
  end

  create_table "beneficiaries", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_number"
    t.index ["account_id"], name: "index_beneficiaries_on_account_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.string "transaction_type"
    t.integer "amount"
    t.decimal "balance"
    t.string "receiver_account_name"
    t.integer "receiver_account_number"
    t.decimal "transaction_fee", precision: 8, scale: 2
    t.bigint "account_id", null: false
    t.bigint "beneficiary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_transactions_on_account_id"
    t.index ["beneficiary_id"], name: "index_transactions_on_beneficiary_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wallets", force: :cascade do |t|
    t.integer "balance"
    t.string "last_transaction"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_transactions_per_day"
    t.integer "total_transactions_per_week"
    t.integer "total_transactions_per_month"
    t.integer "total_transactions_per_year"
    t.decimal "total_amount_per_day"
    t.decimal "total_amount_per_week"
    t.decimal "total_amount_per_month"
    t.decimal "total_amount_per_year"
    t.decimal "total_transaction_fee_per_day"
    t.decimal "total_transaction_fee_per_week"
    t.decimal "total_transaction_fee_per_month"
    t.decimal "total_transaction_fee_per_year"
    t.decimal "company_income_per_day"
    t.decimal "company_income_per_week"
    t.decimal "company_income_per_month"
    t.decimal "company_income_per_year"
    t.integer "account_number"
    t.index ["account_id"], name: "index_wallets_on_account_id"
    t.index ["account_number"], name: "index_wallets_on_account_number", unique: true
  end

  add_foreign_key "accounts", "agents", column: "agent_number", primary_key: "agent_number"
  add_foreign_key "accounts", "users"
  add_foreign_key "agents", "accounts"
  add_foreign_key "beneficiaries", "accounts"
  add_foreign_key "transactions", "accounts"
  add_foreign_key "transactions", "beneficiaries"
  add_foreign_key "wallets", "accounts"
  add_foreign_key "wallets", "accounts", column: "account_number", primary_key: "account_number"
end
