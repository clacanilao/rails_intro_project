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

ActiveRecord::Schema[7.1].define(version: 2024_02_10_073211) do
  create_table "assignments", force: :cascade do |t|
    t.integer "crew_id", null: false
    t.integer "launch_id", null: false
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crew_id"], name: "index_assignments_on_crew_id"
    t.index ["launch_id"], name: "index_assignments_on_launch_id"
  end

  create_table "crews", id: :string, force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.string "status"
    t.string "wikilink"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "launch_pads", id: :string, force: :cascade do |t|
    t.string "name"
    t.string "full_name"
    t.string "description"
    t.string "status"
    t.integer "numberoflaunches"
    t.string "image"
    t.decimal "latitude"
    t.decimal "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "launches", id: :string, force: :cascade do |t|
    t.datetime "date"
    t.integer "rocket_id", null: false
    t.integer "launchpad_id", null: false
    t.string "outcome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["launchpad_id"], name: "index_launches_on_launchpad_id"
    t.index ["rocket_id"], name: "index_launches_on_rocket_id"
  end

  create_table "rockets", id: :string, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.decimal "height"
    t.decimal "mass"
    t.string "variant"
    t.string "image"
    t.integer "costperlaunch"
    t.integer "successratepercent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "assignments", "crews"
  add_foreign_key "assignments", "launches"
  add_foreign_key "launches", "launchpads"
  add_foreign_key "launches", "rockets"
end
