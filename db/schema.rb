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

ActiveRecord::Schema.define(version: 20140117160316) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "poll_users", force: true do |t|
    t.integer  "poll_id"
    t.integer  "user_id"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "poll_users", ["poll_id"], name: "index_poll_users_on_poll_id", using: :btree
  add_index "poll_users", ["user_id"], name: "index_poll_users_on_user_id", using: :btree

  create_table "polls", force: true do |t|
    t.integer  "proposal_id"
    t.integer  "status_poll", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "polls", ["proposal_id"], name: "index_polls_on_proposal_id", using: :btree

  create_table "proposals", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "type_proposal"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "proposals", ["user_id"], name: "index_proposals_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "poll_users", "polls", name: "poll_users_poll_id_fk"
  add_foreign_key "poll_users", "users", name: "poll_users_user_id_fk"

  add_foreign_key "polls", "proposals", name: "polls_proposal_id_fk"

  add_foreign_key "proposals", "users", name: "proposals_user_id_fk"

end
