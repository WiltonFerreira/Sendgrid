# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_10_27_163053) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "events", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.integer "timestamp"
    t.text "event"
    t.text "email"
    t.text "smtp_id"
    t.text "sg_event_id"
    t.text "sg_message_id"
    t.text "category"
    t.text "newsletter"
    t.text "response"
    t.text "reason"
    t.string "ip"
    t.text "useragent"
    t.text "attempt"
    t.text "status"
    t.text "type_id"
    t.text "url"
    t.text "additional_arguments"
    t.integer "event_post_timestamp"
    t.text "raw"
    t.integer "asm_group_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "sent_id", null: false
    t.index ["account_id"], name: "index_events_on_account_id"
    t.index ["sent_id"], name: "index_events_on_sent_id"
  end

  create_table "sents", force: :cascade do |t|
    t.string "account"
    t.text "info", default: "true"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  add_foreign_key "events", "accounts"
  add_foreign_key "events", "sents"
end
