# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_08_13_044936) do

  create_table "locations", force: :cascade do |t|
    t.string "name"
  end

  create_table "services", force: :cascade do |t|
    t.string "description"
  end

  create_table "vehicle_logs", force: :cascade do |t|
    t.integer "log_type"
    t.date "log_date"
    t.integer "odometer"
    t.float "quantity"
    t.float "price_per_gallon"
    t.float "total_cost"
    t.string "notes"
    t.integer "service_id"
    t.integer "location_id"
    t.integer "vehicle_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "make"
    t.string "model"
    t.integer "year"
    t.string "license_plate"
    t.integer "registration_due_month"
  end

end
