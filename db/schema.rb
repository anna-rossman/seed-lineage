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

ActiveRecord::Schema[8.1].define(version: 2026_02_02_003939) do
  create_table "seeds", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.integer "parent_one_id"
    t.integer "parent_two_id"
    t.datetime "updated_at", null: false
    t.index ["parent_one_id"], name: "index_seeds_on_parent_one_id"
    t.index ["parent_two_id"], name: "index_seeds_on_parent_two_id"
  end

  add_foreign_key "seeds", "seeds", column: "parent_one_id"
  add_foreign_key "seeds", "seeds", column: "parent_two_id"
end
