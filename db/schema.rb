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

ActiveRecord::Schema.define(version: 20170215013725) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "caregivers", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "gender"
    t.boolean  "certification"
    t.integer  "yearsofexperience"
    t.text     "experiencedescription"
    t.string   "photo"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["user_id"], name: "index_caregivers_on_user_id", using: :btree
  end

  create_table "caregivers_languages", force: :cascade do |t|
    t.integer  "caregiver_id"
    t.integer  "language_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["caregiver_id"], name: "index_caregivers_languages_on_caregiver_id", using: :btree
    t.index ["language_id"], name: "index_caregivers_languages_on_language_id", using: :btree
  end

  create_table "caregivers_specialties", force: :cascade do |t|
    t.integer  "caregiver_id"
    t.integer  "specialty_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["caregiver_id"], name: "index_caregivers_specialties_on_caregiver_id", using: :btree
    t.index ["specialty_id"], name: "index_caregivers_specialties_on_specialty_id", using: :btree
  end

  create_table "fammembers", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_fammembers_on_user_id", using: :btree
  end

  create_table "languages", force: :cascade do |t|
    t.string   "sglang"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.integer  "fammember_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "gender"
    t.string   "frequency"
    t.text     "condition_description"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["fammember_id"], name: "index_patients_on_fammember_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "comment"
    t.integer  "rating"
    t.string   "usertype"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "searches", force: :cascade do |t|
    t.string   "language"
    t.string   "specialties"
    t.integer  "yearsofexperience"
    t.string   "gender"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "specialties", force: :cascade do |t|
    t.string   "ability"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "caregiver_id"
    t.boolean  "pending",      default: true
    t.boolean  "approved",     default: false
    t.boolean  "cancelled",    default: false
    t.boolean  "concluded",    default: false
    t.date     "start_date"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["caregiver_id"], name: "index_transactions_on_caregiver_id", using: :btree
    t.index ["user_id"], name: "index_transactions_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "contact"
    t.string   "usertype"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "caregivers", "users"
  add_foreign_key "caregivers_languages", "caregivers"
  add_foreign_key "caregivers_languages", "languages"
  add_foreign_key "caregivers_specialties", "caregivers"
  add_foreign_key "caregivers_specialties", "specialties"
  add_foreign_key "fammembers", "users"
  add_foreign_key "patients", "fammembers"
  add_foreign_key "transactions", "caregivers"
  add_foreign_key "transactions", "users"
end
