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

ActiveRecord::Schema.define(version: 20160523024842) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.integer  "phone"
    t.date     "birthday"
    t.string   "email"
    t.string   "location"
    t.string   "interests"
    t.string   "past_activities"
    t.string   "emer_first_name"
    t.string   "emer_last_name"
    t.string   "emer_relation"
    t.integer  "emer_phone"
    t.string   "emer_email"
    t.string   "emer_nationality"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
