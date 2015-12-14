# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151214060223) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "listings", force: :cascade do |t|
    t.string  "name"
    t.string  "size"
    t.string  "description"
    t.integer "price"
    t.string  "features"
    t.string  "product_includes"
    t.string  "product_recommendations"
    t.string  "nicotine_level"
    t.string  "dimensions"
    t.string  "warning_section"
    t.string  "youtube_video_link"
    t.string  "gauges"
    t.string  "ohm_level"
    t.string  "coil_specs"
    t.string  "note"
    t.string  "safety_notes"
    t.string  "section"
  end

end
