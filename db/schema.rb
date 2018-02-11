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

ActiveRecord::Schema.define(version: 20180116175722) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "portal_configs", force: :cascade do |t|
    t.string "end_point"
    t.string "username"
    t.string "password"
    t.string "info"
    t.decimal "version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "portal_users", force: :cascade do |t|
    t.macaddr "stb_mac"
    t.inet "ip"
    t.string "ls"
    t.string "version"
    t.integer "status"
    t.boolean "additional_services_on"
    t.datetime "last_active"
    t.string "login"
    t.decimal "account_balance"
    t.boolean "online"
    t.string "full_name"
    t.string "phone"
    t.string "stb_sn"
    t.string "stb_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "config_id"
    t.string "country"
    t.string "city"
    t.integer "external_id"
    t.index ["full_name"], name: "index_portal_users_on_full_name"
    t.index ["ip"], name: "index_portal_users_on_ip"
    t.index ["last_active"], name: "index_portal_users_on_last_active"
    t.index ["login"], name: "index_portal_users_on_login"
    t.index ["phone"], name: "index_portal_users_on_phone"
    t.index ["stb_mac"], name: "index_portal_users_on_stb_mac"
    t.index ["stb_type"], name: "index_portal_users_on_stb_type"
  end

end
