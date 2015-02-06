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

ActiveRecord::Schema.define(version: 20150202020700) do

  create_table "crew_members", force: :cascade do |t|
    t.string   "name"
    t.string   "rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "replications", force: :cascade do |t|
    t.string   "description"
    t.string   "device"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "crew_member_id"
  end

  add_index "replications", ["crew_member_id"], name: "index_replications_on_crew_member_id"

  create_table "replicator_credit_transactions", force: :cascade do |t|
    t.integer  "amount"
    t.string   "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "crew_member_id"
  end

  add_index "replicator_credit_transactions", ["crew_member_id"], name: "index_replicator_credit_transactions_on_crew_member_id"

  create_table "replicator_debit_transactions", force: :cascade do |t|
    t.integer  "amount"
    t.string   "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "replication_id"
    t.integer  "crew_member_id"
  end

  add_index "replicator_debit_transactions", ["crew_member_id"], name: "index_replicator_debit_transactions_on_crew_member_id"
  add_index "replicator_debit_transactions", ["replication_id"], name: "index_replicator_debit_transactions_on_replication_id"

end
