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

ActiveRecord::Schema.define(:version => 20120405195924) do

  create_table "apartments", :force => true do |t|
    t.string   "unit"
    t.integer  "bedrooms"
    t.integer  "bathrooms"
    t.integer  "sqft"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "building_id"
  end

  create_table "buildings", :force => true do |t|
    t.string   "address"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.boolean  "doorman"
    t.boolean  "elevator"
    t.boolean  "super"
    t.boolean  "coop"
    t.date     "construction_date"
  end

  create_table "reviews", :force => true do |t|
    t.integer  "user_id"
    t.integer  "apartment_id"
    t.integer  "cleanliness"
    t.integer  "pests"
    t.integer  "sunlight"
    t.integer  "convenience"
    t.integer  "noise_level"
    t.integer  "ceilings"
    t.integer  "closet_space"
    t.integer  "intercom_system"
    t.integer  "temp_control"
    t.integer  "appliances"
    t.integer  "countertops"
    t.integer  "floors"
    t.integer  "bathrooms"
    t.integer  "walls"
    t.integer  "utilities"
    t.integer  "neighbors"
    t.integer  "laundry"
    t.integer  "mass_transit"
    t.integer  "neighborhood"
    t.integer  "storage"
    t.integer  "packages"
    t.integer  "super"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "facebook_authentication_token"
    t.string   "facebook_authentication_secret"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "facebook_image_url"
    t.string   "location"
    t.string   "facebook_nickname"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

end
