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

ActiveRecord::Schema.define(version: 20150112022355) do

  create_table "ballots", force: :cascade do |t|
    t.integer  "round"
    t.integer  "judge_id"
    t.integer  "gov_id"
    t.integer  "opp_id"
    t.integer  "pm_id"
    t.integer  "mg_id"
    t.integer  "lo_id"
    t.integer  "mo_id"
    t.integer  "pm_speaks"
    t.integer  "mg_speaks"
    t.integer  "lo_speaks"
    t.integer  "mo_speaks"
    t.integer  "pm_rank"
    t.integer  "mg_rank"
    t.integer  "lo_rank"
    t.integer  "mo_rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "school"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "type"
  end

end
