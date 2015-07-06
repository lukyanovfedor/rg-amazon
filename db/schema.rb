# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150706023134) do

  create_table "addresses", force: :cascade do |t|
    t.string   "address",    limit: 255, null: false
    t.string   "zipcode",    limit: 255, null: false
    t.string   "city",       limit: 255, null: false
    t.string   "phone",      limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "country_id", limit: 4
  end

  add_index "addresses", ["country_id"], name: "index_addresses_on_country_id", using: :btree

  create_table "authors", force: :cascade do |t|
    t.string   "first_name", limit: 255,   null: false
    t.string   "last_name",  limit: 255,   null: false
    t.text     "biography",  limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "books", force: :cascade do |t|
    t.string   "title",          limit: 255,               null: false
    t.text     "descirption",    limit: 65535
    t.float    "price",          limit: 24,                null: false
    t.integer  "books_in_stock", limit: 4,     default: 0
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "category_id",    limit: 4
    t.integer  "author_id",      limit: 4
  end

  add_index "books", ["author_id"], name: "index_books_on_author_id", using: :btree
  add_index "books", ["category_id"], name: "index_books_on_category_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "title",      limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "categories", ["title"], name: "index_categories_on_title", unique: true, using: :btree

  create_table "countries", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "countries", ["name"], name: "index_countries_on_name", unique: true, using: :btree

  create_table "credit_cards", force: :cascade do |t|
    t.string   "number",           limit: 255, null: false
    t.integer  "CVV",              limit: 4,   null: false
    t.integer  "expiration_month", limit: 4,   null: false
    t.integer  "expiration_year",  limit: 4,   null: false
    t.string   "first_name",       limit: 255, null: false
    t.string   "last_name",        limit: 255, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "customer_id",      limit: 4
  end

  add_index "credit_cards", ["customer_id"], name: "index_credit_cards_on_customer_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "email",      limit: 255, null: false
    t.string   "password",   limit: 255, null: false
    t.string   "first_name", limit: 255, null: false
    t.string   "last_name",  limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "customers", ["email"], name: "index_customers_on_email", unique: true, using: :btree

  create_table "order_items", force: :cascade do |t|
    t.float    "price",      limit: 24, null: false
    t.integer  "quantity",   limit: 4,  null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "book_id",    limit: 4
    t.integer  "order_id",   limit: 4
  end

  add_index "order_items", ["book_id"], name: "index_order_items_on_book_id", using: :btree
  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.float    "total_price",         limit: 24,  null: false
    t.string   "state",               limit: 255, null: false
    t.datetime "completed_at",                    null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "customer_id",         limit: 4
    t.integer  "credit_card_id",      limit: 4
    t.integer  "billing_address_id",  limit: 4
    t.integer  "shipping_address_id", limit: 4
  end

  add_index "orders", ["billing_address_id"], name: "index_orders_on_billing_address_id", using: :btree
  add_index "orders", ["credit_card_id"], name: "index_orders_on_credit_card_id", using: :btree
  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id", using: :btree
  add_index "orders", ["shipping_address_id"], name: "index_orders_on_shipping_address_id", using: :btree

  create_table "ratings", force: :cascade do |t|
    t.integer  "rating_number", limit: 4,     null: false
    t.text     "review",        limit: 65535, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "book_id",       limit: 4
    t.integer  "customer_id",   limit: 4
  end

  add_index "ratings", ["book_id"], name: "index_ratings_on_book_id", using: :btree
  add_index "ratings", ["customer_id"], name: "index_ratings_on_customer_id", using: :btree

  add_foreign_key "addresses", "countries"
  add_foreign_key "books", "authors"
  add_foreign_key "books", "categories"
  add_foreign_key "credit_cards", "customers"
  add_foreign_key "order_items", "books"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "addresses", column: "billing_address_id"
  add_foreign_key "orders", "addresses", column: "shipping_address_id"
  add_foreign_key "orders", "credit_cards"
  add_foreign_key "orders", "customers"
  add_foreign_key "ratings", "books"
  add_foreign_key "ratings", "customers"
end
