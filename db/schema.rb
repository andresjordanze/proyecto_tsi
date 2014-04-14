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

ActiveRecord::Schema.define(version: 20140414034138) do

  create_table "brands", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "incomes", force: true do |t|
    t.integer  "cantidad"
    t.integer  "product_id"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "incomes", ["order_id"], name: "index_incomes_on_order_id"
  add_index "incomes", ["product_id"], name: "index_incomes_on_product_id"

  create_table "orders", force: true do |t|
    t.integer  "cantidad"
    t.string   "nombre_producto"
    t.string   "numero_pedido"
    t.string   "estado"
    t.string   "provider"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "detail"
    t.text     "description"
    t.string   "general_code"
    t.string   "brand"
    t.string   "category"
    t.float    "bought_price"
    t.float    "sale_price"
    t.integer  "quantity"
    t.integer  "increase"
    t.boolean  "home"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "providers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sales", force: true do |t|
    t.float    "price"
    t.integer  "check_number"
    t.string   "client_name"
    t.integer  "nit"
    t.boolean  "confirmed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subproducts", force: true do |t|
    t.string   "code"
    t.boolean  "available"
    t.integer  "product_id"
    t.integer  "sale_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subproducts", ["product_id"], name: "index_subproducts_on_product_id"
  add_index "subproducts", ["sale_id"], name: "index_subproducts_on_sale_id"

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "name"
    t.string   "rol"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
