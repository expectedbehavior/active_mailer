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

ActiveRecord::Schema.define(version: 20130220212407) do

  create_table "email_user_associations", force: :cascade do |t|
    t.integer  "email_user_id"
    t.string   "emailable_type"
    t.integer  "emailable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "email_users", force: :cascade do |t|
    t.string   "email_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invitation_emails", force: :cascade do |t|
    t.integer  "sender_id"
    t.datetime "sent_at"
    t.string   "subject"
    t.integer  "invitation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
