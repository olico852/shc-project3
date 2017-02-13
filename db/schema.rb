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

ActiveRecord::Schema.define(version: 20170212144014) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "caregivers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "contact"
    t.string   "email"
    t.string   "password_digest"
    t.string   "gender"
    t.string   "certification"
    t.integer  "yearsofexperience"
    t.text     "experiencedescription"
    t.string   "photo"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "careseekers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "contact"
    t.string   "emai"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fammembers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "contact"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "patients", force: :cascade do |t|
    t.integer  "fammember_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "gender"
    t.text     "condition_description"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["fammember_id"], name: "index_patients_on_fammember_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "usertypes_type"
    t.integer  "usertypes_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["usertypes_type", "usertypes_id"], name: "index_users_on_usertypes_type_and_usertypes_id", using: :btree
  end

  add_foreign_key "patients", "fammembers"
end
