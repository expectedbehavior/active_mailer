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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130220212407) do

  create_table "email_user_associations", :force => true do |t|
    t.integer  "email_user_id"
    t.string   "emailable_type"
    t.integer  "emailable_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "email_users", :force => true do |t|
    t.string   "email_address"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "invitation_emails", :force => true do |t|
    t.integer  "sender_id"
    t.datetime "sent_at"
    t.string   "subject"
    t.integer  "invitation_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
