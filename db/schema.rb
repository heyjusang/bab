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

ActiveRecord::Schema.define(:version => 20111230130113) do

  create_table "evaluations", :force => true do |t|
    t.integer  "restaurant_id"
    t.integer  "user_id"
    t.integer  "speed"
    t.integer  "taste"
    t.integer  "amount"
    t.integer  "service"
    t.string   "review"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goodbads", :force => true do |t|
    t.integer  "menu_id"
    t.integer  "user_id"
    t.boolean  "good"
    t.boolean  "bad"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menus", :force => true do |t|
    t.string   "menuname"
    t.integer  "price"
    t.integer  "like"
    t.integer  "dislike"
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurants", :force => true do |t|
    t.string   "resname"
    t.integer  "phone"
    t.integer  "tastepoint"
    t.integer  "speedpoint"
    t.integer  "servicepoint"
    t.integer  "amountpoint"
    t.integer  "count"
    t.text     "resinfo"
    t.integer  "restype"
    t.string   "imageurl"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "mailname"
    t.string   "username"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
