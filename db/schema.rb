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

ActiveRecord::Schema.define(:version => 20111115153742) do

  create_table "devices", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status_id"
    t.integer  "location_id"
    t.integer  "uniq_number"
    t.string   "device_type"
    t.integer  "inventory_number"
    t.integer  "serial_number"
    t.string   "mr_unit"
    t.date     "next_mr_date"
    t.date     "prev_mr_date"
    t.string   "site"
    t.string   "tech_unit"
    t.integer  "replace_param"
    t.boolean  "form_of_mr"
    t.integer  "replacement_id"
    t.boolean  "has_replacement"
  end

  create_table "location_statuses", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_id"
    t.integer  "status_id"
  end

  create_table "locations", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "replacement_pairs", :force => true do |t|
    t.integer  "device_id"
    t.integer  "replacement_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
  end

  add_index "users", ["name"], :name => "index_users_on_name", :unique => true

end
