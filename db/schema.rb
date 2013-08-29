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

ActiveRecord::Schema.define(:version => 20130816185526) do

  create_table "categories", :force => true do |t|
    t.string   "addcategory", :limit => 30, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "categories_histories", :force => true do |t|
    t.integer "category_id"
    t.integer "history_id"
  end

  create_table "classifications", :force => true do |t|
    t.string   "name"
    t.integer  "min_age"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "contacts", :force => true do |t|
    t.string   "ctype",      :null => false
    t.string   "subject",    :null => false
    t.string   "cemail",     :null => false
    t.string   "link",       :null => false
    t.text     "message",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "favorites", :force => true do |t|
    t.integer  "user_id"
    t.integer  "history_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "histories", :force => true do |t|
    t.string   "title",             :limit => 70, :null => false
    t.string   "description"
    t.integer  "category",                        :null => false
    t.string   "note"
    t.text     "ahistory",                        :null => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "classification_id"
    t.integer  "favorite_id"
  end

  create_table "rates", :force => true do |t|
    t.integer  "history_id"
    t.integer  "user_id"
    t.integer  "urate"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "owner"
  end

  create_table "rules", :force => true do |t|
    t.text     "uprules",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name",       :limit => 50,  :null => false
    t.string   "email",      :limit => 100, :null => false
    t.string   "nick",       :limit => 35,  :null => false
    t.string   "password",   :limit => 50,  :null => false
    t.date     "born_at",                   :null => false
    t.string   "situation"
    t.string   "hobby",      :limit => 150
    t.boolean  "admin"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

end
