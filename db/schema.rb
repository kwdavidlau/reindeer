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

ActiveRecord::Schema.define(version: 20160713172200) do

  create_table "children", force: :cascade do |t|
    t.integer  "gift_id"
    t.integer  "age"
    t.string   "name"
    t.string   "address"
    t.boolean  "received"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deliveries", force: :cascade do |t|
    t.integer  "reindeer_id"
    t.datetime "time_to_deliver"
    t.boolean  "delivery_status", default: false
    t.index ["reindeer_id"], name: "index_deliveries_on_reindeer_id"
  end

  create_table "gifts", force: :cascade do |t|
    t.integer  "delivery_id"
    t.string   "name_of_gift"
    t.integer  "gift_value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["delivery_id"], name: "index_gifts_on_delivery_id"
  end

  create_table "reindeers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "mobile"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
