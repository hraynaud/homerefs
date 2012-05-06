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

ActiveRecord::Schema.define(:version => 20120506014232) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "apartments", :force => true do |t|
    t.string   "unit"
    t.integer  "bedrooms"
    t.integer  "bathrooms"
    t.integer  "sqft"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "building_id"
    t.float    "avg_score",   :default => 0.0
  end

  create_table "building_images", :force => true do |t|
    t.integer  "building_id"
    t.integer  "user_id"
    t.integer  "review_id"
    t.string   "image_file_name"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "buildings", :force => true do |t|
    t.string   "address"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.boolean  "doorman"
    t.boolean  "elevator"
    t.boolean  "super"
    t.boolean  "coop"
    t.string   "city"
    t.string   "zipcode"
    t.integer  "default_image_id"
    t.integer  "neighborhood_id"
    t.integer  "construction_type"
  end

  create_table "feedbacks", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "identities", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "user_id"
  end

  create_table "neighborhoods", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "review_metadata", :force => true do |t|
    t.string   "field_name"
    t.string   "hi_text",      :default => "High"
    t.string   "low_text",     :default => "Low"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.integer  "field_weight", :default => 1
  end

  create_table "reviews", :force => true do |t|
    t.integer  "user_id"
    t.integer  "building_id"
    t.integer  "cleanliness"
    t.integer  "pests"
    t.integer  "sunlight"
    t.integer  "noise_level"
    t.integer  "ceilings"
    t.integer  "closet_space"
    t.integer  "temp_control"
    t.integer  "appliances"
    t.integer  "countertops"
    t.integer  "floors"
    t.integer  "bathrooms"
    t.integer  "walls"
    t.integer  "utilities"
    t.integer  "neighbors"
    t.integer  "laundry"
    t.integer  "prox_mass_transit"
    t.integer  "neighborhood"
    t.integer  "storage"
    t.integer  "super"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "comment"
    t.string   "image1_file_name"
    t.string   "image1_content_type"
    t.integer  "image1_file_size"
    t.datetime "image1_updated_at"
    t.string   "image2_file_name"
    t.string   "image2_content_type"
    t.integer  "image2_file_size"
    t.datetime "image2_updated_at"
    t.string   "image3_file_name"
    t.string   "image3_content_type"
    t.integer  "image3_file_size"
    t.datetime "image3_updated_at"
    t.integer  "apt_size"
    t.integer  "assessment"
    t.integer  "rent"
    t.integer  "years_lived",         :default => 1
  end

  create_table "user_tokens", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
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
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.string   "provider"
    t.string   "uid"
    t.datetime "dob"
    t.string   "gender",                         :limit => 1
  end

end
