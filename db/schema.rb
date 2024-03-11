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

ActiveRecord::Schema.define(version: 2024_03_11_073801) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.bigint "coach_id", null: false
    t.bigint "guest_id", null: false
    t.bigint "time_slot_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coach_id"], name: "index_appointments_on_coach_id"
    t.index ["guest_id"], name: "index_appointments_on_guest_id"
    t.index ["time_slot_id"], name: "index_appointments_on_time_slot_id"
  end

  create_table "coaches", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.bigint "time_zone_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["time_zone_id"], name: "index_coaches_on_time_zone_id"
  end

  create_table "guests", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "time_slots", force: :cascade do |t|
    t.bigint "coach_id", null: false
    t.date "date"
    t.time "start_time"
    t.time "end_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coach_id"], name: "index_time_slots_on_coach_id"
  end

  create_table "time_zones", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "weekly_schedules", force: :cascade do |t|
    t.bigint "coach_id", null: false
    t.integer "day_of_week"
    t.time "available_at"
    t.time "available_until"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coach_id"], name: "index_weekly_schedules_on_coach_id"
  end

  add_foreign_key "appointments", "coaches"
  add_foreign_key "appointments", "guests"
  add_foreign_key "appointments", "time_slots"
  add_foreign_key "coaches", "time_zones"
  add_foreign_key "time_slots", "coaches"
  add_foreign_key "weekly_schedules", "coaches"
end
