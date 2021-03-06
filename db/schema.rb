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

ActiveRecord::Schema.define(version: 20180224141719) do

  create_table "chapters", force: :cascade do |t|
    t.integer "number"
    t.string "name"
    t.string "prefix"
    t.integer "specification_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "format", default: "usdm"
    t.integer "original_id"
  end

  create_table "functions", force: :cascade do |t|
    t.string "name"
    t.integer "requirement_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "original_id"
  end

  create_table "keywords", force: :cascade do |t|
    t.string "name"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "member_roles", force: :cascade do |t|
    t.integer "member_id"
    t.integer "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "project_id"
  end

  create_table "operations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "permissions", force: :cascade do |t|
    t.integer "role_id"
    t.integer "operation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requirements", force: :cascade do |t|
    t.integer "number"
    t.string "content"
    t.string "reason"
    t.string "description"
    t.integer "section_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "original_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sections", force: :cascade do |t|
    t.integer "number"
    t.string "name"
    t.integer "chapter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "original_id"
  end

  create_table "sheet_pictures", force: :cascade do |t|
    t.string "picture"
    t.integer "sheet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "original_id"
  end

  create_table "sheets", force: :cascade do |t|
    t.text "content"
    t.integer "chapter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "original_id"
  end

  create_table "spec_keywords", force: :cascade do |t|
    t.integer "spec_id"
    t.integer "keyword_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "specifications", force: :cascade do |t|
    t.string "title"
    t.integer "version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "project_id"
    t.integer "original_id"
  end

  create_table "specs", force: :cascade do |t|
    t.text "content"
    t.integer "function_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number"
    t.boolean "customer_review", default: false
    t.boolean "design_review", default: false
    t.boolean "test_review", default: false
    t.string "picture"
    t.integer "original_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.string "password_digest"
    t.string "email"
    t.string "status", default: "registered"
  end

end
