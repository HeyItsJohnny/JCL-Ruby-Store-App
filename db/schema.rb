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

ActiveRecord::Schema.define(version: 20140707111715) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "widgets", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "stock"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
    
  create_table "carts", force: true do |t|     
      t.datetime "created_at", null: false     
      t.datetime "updated_at", null: false   
  end 
  
  create_table "lineitems", force: true do |t|     
      t.integer  "item_id"     
      t.integer  "cart_id"     
      t.integer  "order_id"
      t.datetime "created_at",             null: false     
      t.datetime "updated_at",             null: false   
      t.integer  "quantity",   default: 1 
  end   
    
  add_index "lineitems", ["cart_id"], name: "index_lineitems_on_cart_id" 
  add_index "lineitems", ["item_id"], name: "index_lineitems_on_item_id"
  add_index "lineitems", ["order_id"], name: "index_lineitems_on_order_id"
    
  create_table "items", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "image"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
    
  create_table "orders", force: true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "email"
    t.string   "paytype"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
    
  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "password"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
    
end
