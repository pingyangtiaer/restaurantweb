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

ActiveRecord::Schema.define(version: 20131127164554) do

  create_table "addresses", force: true do |t|
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zip"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["addressable_id", "addressable_type"], name: "index_addresses_on_addressable_id_and_addressable_type"

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "cart_items", force: true do |t|
    t.string   "name"
    t.string   "note"
    t.decimal  "price",              precision: 8, scale: 2
    t.integer  "quantity",                                   default: 1
    t.integer  "cart_id"
    t.integer  "cart_itemable_id"
    t.string   "cart_itemable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cart_items", ["cart_id"], name: "index_cart_items_on_cart_id"
  add_index "cart_items", ["cart_itemable_id", "cart_itemable_type"], name: "index_cart_items_on_cart_itemable_id_and_cart_itemable_type"

  create_table "carts", force: true do |t|
    t.string   "delivery_type",                         default: "delivery", null: false
    t.decimal  "delivery_fee",  precision: 8, scale: 2, default: 0.0
    t.integer  "store_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "carts", ["store_id"], name: "index_carts_on_store_id"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "desc"
    t.integer  "rank"
    t.string   "avatar"
    t.integer  "menu_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["menu_id"], name: "index_categories_on_menu_id"

  create_table "coupons", force: true do |t|
    t.string   "name"
    t.string   "desc"
    t.integer  "rank"
    t.string   "avatar"
    t.decimal  "price",      precision: 8, scale: 2
    t.decimal  "minimum",    precision: 8, scale: 2
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer  "store_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "coupons", ["store_id"], name: "index_coupons_on_store_id"

  create_table "dishes", force: true do |t|
    t.string   "name"
    t.string   "desc"
    t.integer  "rank"
    t.string   "avatar"
    t.decimal  "price"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dishes", ["category_id"], name: "index_dishes_on_category_id"

  create_table "menus", force: true do |t|
    t.string   "name"
    t.string   "desc"
    t.integer  "rank"
    t.string   "avatar"
    t.integer  "store_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "menus", ["store_id"], name: "index_menus_on_store_id"

  create_table "orders", force: true do |t|
    t.string   "note"
    t.string   "payment_type",                           default: "cash",     null: false
    t.string   "payment_status",                         default: "not_paid", null: false
    t.decimal  "tip",            precision: 8, scale: 2, default: 0.0
    t.integer  "store_id"
    t.integer  "cart_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["cart_id"], name: "index_orders_on_cart_id"
  add_index "orders", ["store_id"], name: "index_orders_on_store_id"
  add_index "orders", ["user_id"], name: "index_orders_on_user_id"

  create_table "stores", force: true do |t|
    t.string   "name"
    t.string   "desc"
    t.integer  "rank"
    t.string   "avatar"
    t.string   "phone"
    t.string   "fax"
    t.decimal  "delivery_minimum"
    t.decimal  "delivery_fee"
    t.integer  "delivery_radius"
    t.integer  "admin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stores", ["admin_id"], name: "index_stores_on_admin_id"

  create_table "subscriptions", force: true do |t|
    t.integer  "store_id"
    t.integer  "subscribable_id"
    t.string   "subscribable_type"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subscriptions", ["store_id"], name: "index_subscriptions_on_store_id"
  add_index "subscriptions", ["subscribable_id", "subscribable_type"], name: "index_subscriptions_on_subscribable_id_and_subscribable_type"

  create_table "templates", force: true do |t|
    t.string   "name"
    t.string   "desc"
    t.integer  "rank"
    t.string   "avatar"
    t.decimal  "price"
    t.integer  "interval"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "phone"
    t.string   "avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end