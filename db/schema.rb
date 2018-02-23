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

ActiveRecord::Schema.define(version: 20180223202108) do

  create_table "authentication_identities", force: :cascade do |t|
    t.string "provider"
    t.integer "user_id"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "learning_accomplishments", force: :cascade do |t|
    t.integer "status"
    t.integer "user_id"
    t.integer "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "learning_topics", force: :cascade do |t|
    t.string "title"
    t.integer "course_id"
    t.integer "parent_topic_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "learning_users_group_users", force: :cascade do |t|
    t.integer "users_group_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_learning_users_group_users_on_user_id"
    t.index ["users_group_id"], name: "index_learning_users_group_users_on_users_group_id"
  end

  create_table "learning_users_groups", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "image_url"
    t.string "github_uid", null: false
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "github_url"
    t.index ["github_uid"], name: "index_users_on_github_uid", unique: true
  end

end
