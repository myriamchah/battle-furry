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

ActiveRecord::Schema.define(version: 2019_08_06_095446) do

  create_table "fights", force: :cascade do |t|
    t.integer "fighter_1_id", null: false
    t.integer "fighter_2_id", null: false
    t.integer "strokes"
    t.string "winner"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fighter_1_id"], name: "index_fights_on_fighter_1_id"
    t.index ["fighter_2_id"], name: "index_fights_on_fighter_2_id"
  end

  create_table "warriors", force: :cascade do |t|
    t.string "name"
    t.string "intro"
    t.string "avatar"
    t.integer "life_points"
    t.integer "strength"
    t.integer "xp"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "fights", "warriors", column: "fighter_1_id"
  add_foreign_key "fights", "warriors", column: "fighter_2_id"
end
