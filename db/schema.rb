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

ActiveRecord::Schema[7.0].define(version: 2022_08_24_092751) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.datetime "date"
    t.text "comments"
    t.integer "number_of_guests"
    t.integer "status"
    t.bigint "user_id", null: false
    t.bigint "offer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_bookings_on_offer_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "ingredients"
    t.bigint "user_id", null: false
    t.bigint "offer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_url"
    t.index ["offer_id"], name: "index_meals_on_offer_id"
    t.index ["user_id"], name: "index_meals_on_user_id"
  end

  create_table "offers", force: :cascade do |t|
    t.string "title"
    t.string "price_per_person"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
    t.string "photo_url"
    t.index ["user_id"], name: "index_offers_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.string "comment"
    t.bigint "booking_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_reviews_on_booking_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "photo_url"
    t.boolean "chef"
    t.string "chef_location"
    t.string "address"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "offers"
  add_foreign_key "bookings", "users"
  add_foreign_key "meals", "offers"
  add_foreign_key "meals", "users"
  add_foreign_key "offers", "users"
  add_foreign_key "reviews", "bookings"
end
