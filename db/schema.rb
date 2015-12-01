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

ActiveRecord::Schema.define(version: 20151201103832) do

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_members", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "teammember_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "company_id"
    t.string   "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

# Could not dump table "task_types" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "tasks", force: :cascade do |t|
    t.string   "name"
    t.string   "biz_owner"
    t.date     "biz_plan_start_dt"
    t.date     "biz_plan_end_dt"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "biz_owner_id"
  end

  create_table "teammembers", force: :cascade do |t|
    t.string   "name"
    t.string   "display_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
