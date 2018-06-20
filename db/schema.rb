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

ActiveRecord::Schema.define(version: 20180620135433) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.datetime "beginDate"
    t.datetime "endDate"
    t.bigint "work_order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["work_order_id"], name: "index_appointments_on_work_order_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "address"
    t.string "postcode"
    t.string "propertyReference"
    t.boolean "maintainable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.string "managerName"
    t.string "managerPhone"
    t.string "managerEmail"
    t.integer "floors"
    t.integer "entranceDoors"
    t.integer "lifts"
    t.string "heating"
    t.string "parentReference"
    t.integer "floor"
    t.integer "toilets"
    t.integer "bathrooms"
  end

  create_table "repairs", force: :cascade do |t|
    t.string "repairRequestReference"
    t.string "propertyReference"
    t.string "problemDescription"
    t.string "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "contact_name"
    t.string "contact_telephoneNumber"
    t.string "contact_emailAddress"
    t.string "contact_callbackTime"
  end

  create_table "residents", force: :cascade do |t|
    t.bigint "dwelling_id"
    t.string "residentReference"
    t.string "name"
    t.datetime "last_call"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dwelling_id"], name: "index_residents_on_dwelling_id"
  end

  create_table "work_orders", force: :cascade do |t|
    t.string "workOrderReference"
    t.string "sorCode"
    t.string "supplierReference"
    t.bigint "repair_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "estimatedCost"
    t.string "repairType"
    t.string "status"
    t.datetime "dueDate"
    t.datetime "expectedCompletion"
    t.datetime "attendedDate"
    t.string "attendedBy"
    t.string "outcome"
    t.string "cancelledDate"
    t.index ["repair_id"], name: "index_work_orders_on_repair_id"
  end

  add_foreign_key "appointments", "work_orders"
  add_foreign_key "work_orders", "repairs"
end
