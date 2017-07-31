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

ActiveRecord::Schema.define(version: 20170730031508) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "data_sources", force: :cascade do |t|
    t.string "name", null: false
    t.string "uid", null: false
    t.string "external_key", null: false
    t.text "description"
    t.integer "some_field"
    t.integer "some_other_field"
    t.decimal "transaction_value"
    t.datetime "transaction_time"
    t.string "some_string_field"
    t.string "some_other_string_field"
    t.string "items", array: true
    t.integer "item_ids", array: true
    t.json "meta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["external_key"], name: "index_data_sources_on_external_key"
    t.index ["some_field"], name: "index_data_sources_on_some_field"
    t.index ["uid"], name: "index_data_sources_on_uid"
  end

end
