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

ActiveRecord::Schema.define(version: 20150907141701) do

  create_table "bookmarks", force: true do |t|
    t.string   "title"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "angry"
    t.string   "disgust"
    t.string   "fear"
    t.string   "happy"
    t.string   "neutral"
    t.string   "sad"
    t.string   "surprise"
    t.text     "canv"
  end

  create_table "caminputs", force: true do |t|
    t.string   "username"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "angry"
    t.string   "disgust"
    t.string   "fear"
    t.string   "happy"
    t.string   "neutral"
    t.string   "sad"
    t.string   "surprise"
    t.text     "canv"
  end

  create_table "usergames", force: true do |t|
    t.string "name"
    t.string "email"
    t.string "score"
    t.string "rank"
    t.string "stat"
    t.text   "ft"
    t.text   "ft1"
    t.text   "ft2"
    t.text   "ft3"
    t.text   "ft4"
    t.text   "ft5"
    t.text   "ft6"
    t.text   "ft7"
    t.string "path1"
    t.string "path2"
    t.string "path3"
    t.string "path4"
    t.string "path5"
    t.string "path6"
    t.string "path7"
    t.string "angry"
    t.string "disgust"
    t.string "fear"
    t.string "happy"
    t.string "neutral"
    t.string "sad"
    t.string "surprise"
  end

end
