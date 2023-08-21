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

ActiveRecord::Schema[7.0].define(version: 2023_08_20_225253) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "number"
    t.string "neighborhood"
    t.string "latitude"
    t.string "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "photo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text "text_content"
    t.bigint "user_id", null: false
    t.bigint "enterprise_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["enterprise_id"], name: "index_comments_on_enterprise_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "enterprise_photos", force: :cascade do |t|
    t.string "first_photo_url"
    t.string "second_photo_url"
    t.string "third_photo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "enterprise_id", null: false
    t.index ["enterprise_id"], name: "index_enterprise_photos_on_enterprise_id"
  end

  create_table "enterprises", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "cellphone"
    t.bigint "user_id", null: false
    t.bigint "category_id", null: false
    t.bigint "enterprise_photo_id", null: false
    t.bigint "address_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_enterprises_on_address_id"
    t.index ["category_id"], name: "index_enterprises_on_category_id"
    t.index ["enterprise_photo_id"], name: "index_enterprises_on_enterprise_photo_id"
    t.index ["user_id"], name: "index_enterprises_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "date"
    t.string "time"
    t.string "description"
    t.string "photo_url"
    t.bigint "address_id", null: false
    t.bigint "enterprise_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_events_on_address_id"
    t.index ["enterprise_id"], name: "index_events_on_enterprise_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "enterprises"
  add_foreign_key "comments", "users"
  add_foreign_key "enterprise_photos", "enterprises"
  add_foreign_key "enterprises", "addresses"
  add_foreign_key "enterprises", "categories"
  add_foreign_key "enterprises", "enterprise_photos"
  add_foreign_key "enterprises", "users"
  add_foreign_key "events", "addresses"
  add_foreign_key "events", "enterprises"
end
