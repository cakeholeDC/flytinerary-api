# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_07_190928) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string "event_type"
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.string "start_location"
    t.string "end_location"
    t.string "company_agency"
    t.string "reservation_number"
    t.text "notes"
    t.bigint "trip_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "start_latitude", precision: 10, scale: 6
    t.decimal "start_longitude", precision: 10, scale: 6
    t.decimal "end_latitude", precision: 10, scale: 6
    t.decimal "end_longitude", precision: 10, scale: 6
    t.index ["trip_id"], name: "index_events_on_trip_id"
  end

  create_table "traveler_events", force: :cascade do |t|
    t.bigint "traveler_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_traveler_events_on_event_id"
    t.index ["traveler_id"], name: "index_traveler_events_on_traveler_id"
  end

  create_table "traveler_trips", force: :cascade do |t|
    t.bigint "traveler_id", null: false
    t.bigint "trip_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["traveler_id"], name: "index_traveler_trips_on_traveler_id"
    t.index ["trip_id"], name: "index_traveler_trips_on_trip_id"
  end

  create_table "travelers", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "trips", force: :cascade do |t|
    t.string "nickname"
    t.string "destination"
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.bigint "traveler_id", null: false
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.index ["traveler_id"], name: "index_trips_on_traveler_id"
  end

  add_foreign_key "events", "trips"
  add_foreign_key "traveler_events", "events"
  add_foreign_key "traveler_events", "travelers"
  add_foreign_key "traveler_trips", "travelers"
  add_foreign_key "traveler_trips", "trips"
  add_foreign_key "trips", "travelers"
end
