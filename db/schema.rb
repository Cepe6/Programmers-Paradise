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

ActiveRecord::Schema.define(version: 20170513062945) do

  create_table "jobs", force: :cascade do |t|
    t.integer  "author_id"
    t.text     "description"
    t.string   "job_type"
    t.integer  "salary"
    t.string   "currency"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
  end

  create_table "tutorials", force: :cascade do |t|
    t.string   "youtube_id"
    t.string   "youtube_name"
    t.text     "youtube_description"
    t.integer  "youtube_votes"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "users", force: :cascade do |t|
    t.boolean  "active",              default: true
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.string   "position"
    t.string   "cv_file_name"
    t.string   "cv_content_type"
    t.integer  "cv_file_size"
    t.datetime "cv_updated_at"
    t.datetime "birthdate"
    t.string   "gender"
    t.string   "preffered_langs"
    t.string   "country"
    t.integer  "forum_points",        default: 0
    t.string   "feedbacks"
    t.string   "tutorials"
    t.integer  "tutorial_points",     default: 0
    t.string   "teaching_courses"
    t.integer  "teaching_points",     default: 0
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

end
