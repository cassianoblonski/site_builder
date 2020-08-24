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

ActiveRecord::Schema.define(version: 2020_08_24_235409) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "calendar_widgets", force: :cascade do |t|
    t.string "title"
    t.date "day"
    t.integer "position"
    t.bigint "website_config_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["website_config_id"], name: "index_calendar_widgets_on_website_config_id"
  end

  create_table "text_widgets", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.string "background_color"
    t.integer "position"
    t.bigint "website_config_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["website_config_id"], name: "index_text_widgets_on_website_config_id"
  end

  create_table "video_widgets", force: :cascade do |t|
    t.string "url"
    t.string "title"
    t.integer "position"
    t.bigint "website_config_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["website_config_id"], name: "index_video_widgets_on_website_config_id"
  end

  create_table "weather_widgets", force: :cascade do |t|
    t.integer "lat"
    t.integer "long"
    t.integer "position"
    t.bigint "website_config_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["website_config_id"], name: "index_weather_widgets_on_website_config_id"
  end

  create_table "website_builds", force: :cascade do |t|
    t.text "html"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "website_configs", force: :cascade do |t|
    t.string "title_color"
    t.string "background_color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "site_name"
    t.string "icon_url"
    t.string "banner_background_color"
    t.string "job_status"
  end

  add_foreign_key "calendar_widgets", "website_configs"
  add_foreign_key "text_widgets", "website_configs"
  add_foreign_key "video_widgets", "website_configs"
  add_foreign_key "weather_widgets", "website_configs"
end
