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

ActiveRecord::Schema.define(:version => 20120101152955) do

  create_table "auto_positions", :force => true do |t|
    t.string   "title"
    t.string   "project_specification"
    t.string   "technological_unit"
    t.string   "automation_area"
    t.string   "function"
    t.string   "parameter_name"
    t.string   "parameter_range"
    t.string   "parameter_measurement_units"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "device_id"
  end

  create_table "devices", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status_id"
    t.integer  "location_id"
    t.string   "device_type"
    t.integer  "inventory_number"
    t.integer  "serial_number"
    t.string   "mr_unit"
    t.date     "next_mr_date"
    t.date     "prev_mr_date"
    t.integer  "replace_param"
    t.integer  "replacement_id"
    t.boolean  "has_replacement"
    t.string   "input_range"
    t.string   "input_measurement_units"
    t.string   "output_range"
    t.string   "output_measurement_units"
    t.string   "model"
    t.integer  "uniq_number_in_ASOMI"
    t.date     "year_of_production"
    t.date     "beginning_operation_year"
    t.string   "changeover_input_range"
    t.string   "changeover_input_measurement_units"
    t.string   "passport"
    t.string   "passport_store_place"
    t.string   "passport_electronic_version"
    t.string   "tech_description"
    t.string   "tech_description_store_place"
    t.string   "tech_description_electronic_version"
    t.string   "user_manual"
    t.string   "user_manual_store_place"
    t.string   "user_manual_electronic_version"
    t.float    "gold"
    t.float    "silver"
    t.float    "platinum"
    t.float    "PG_metals"
    t.string   "subreport_number"
    t.string   "ENS_number"
    t.string   "comment"
    t.string   "form_of_mr"
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

  create_table "logs", :force => true do |t|
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "device_id"
    t.string   "old_value"
    t.string   "new_value"
    t.string   "attr"
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
    t.boolean  "admin",              :default => false
  end

  add_index "users", ["name"], :name => "index_users_on_name", :unique => true

end
