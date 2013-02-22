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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130222041506) do

  create_table "bookings", :force => true do |t|
    t.date     "booking_date"
    t.integer  "booking_length"
    t.integer  "room_id"
    t.integer  "customer_id"
    t.integer  "hotel_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "bookings", ["customer_id"], :name => "index_bookings_on_customer_id"
  add_index "bookings", ["hotel_id"], :name => "index_bookings_on_hotel_id"
  add_index "bookings", ["room_id"], :name => "index_bookings_on_room_id"

  create_table "customers", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "password"
    t.string   "secret_question"
    t.string   "secret_answer"
    t.string   "default_credit_card_no"
  end

  create_table "hotels", :force => true do |t|
    t.string   "hotel_name"
    t.string   "address"
    t.string   "city"
    t.string   "email"
    t.string   "phone"
    t.string   "website"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "items", :force => true do |t|
    t.string   "name"
    t.integer  "price"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "quantity"
    t.integer  "item_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "done"
  end

  add_index "orders", ["item_id"], :name => "index_orders_on_item_id"

  create_table "products", :force => true do |t|
    t.string   "category"
    t.string   "subcategory"
    t.string   "brand"
    t.string   "model"
    t.string   "description"
    t.decimal  "price",       :precision => 10, :scale => 0
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "rooms", :force => true do |t|
    t.string   "room_name"
    t.decimal  "room_rate",  :precision => 10, :scale => 0
    t.string   "room_type"
    t.integer  "hotel_id"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "rooms", ["hotel_id"], :name => "index_rooms_on_hotel_id"

  create_table "sales", :force => true do |t|
    t.integer  "quantity"
    t.string   "credit_card_no"
    t.decimal  "discount",       :precision => 10, :scale => 0
    t.integer  "product_id"
    t.integer  "customer_id"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

  add_index "sales", ["customer_id"], :name => "index_sales_on_customer_id"
  add_index "sales", ["product_id"], :name => "index_sales_on_product_id"

end
