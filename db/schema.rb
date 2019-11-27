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

ActiveRecord::Schema.define(version: 2019_11_23_135557) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cells", force: :cascade do |t|
    t.integer "row"
    t.integer "column"
    t.integer "status"
    t.integer "value"
    t.integer "play_number"
    t.bigint "game_board_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_board_id"], name: "index_cells_on_game_board_id"
  end

  create_table "game_boards", force: :cascade do |t|
    t.integer "columns", null: false
    t.integer "rows", null: false
    t.integer "mines", null: false
    t.datetime "start_at", default: "2019-11-23 14:08:44"
    t.datetime "end_at"
    t.integer "total_plays", default: 0
    t.integer "status"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_game_boards_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "cells", "game_boards"
  add_foreign_key "game_boards", "users"
end
