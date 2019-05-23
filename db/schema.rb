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

ActiveRecord::Schema.define(version: 20190520122318) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "status", default: true
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dishes", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "price"
    t.integer "promotion"
    t.string "status", default: "t"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_dishes_on_category_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "table_id"
    t.integer "numbers_people"
    t.boolean "status", default: false
    t.datetime "datetime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reserved_dishes", force: :cascade do |t|
    t.integer "quantity"
    t.integer "reservation_id"
    t.integer "dish_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dish_id"], name: "index_reserved_dishes_on_dish_id"
    t.index ["reservation_id"], name: "index_reserved_dishes_on_reservation_id"
  end

  create_table "salaries", force: :cascade do |t|
    t.float "salary"
    t.date "from_date"
    t.date "to_date"
    t.integer "staff_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["staff_id"], name: "index_salaries_on_staff_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "password"
    t.string "gender", default: "male"
    t.date "birth_date"
    t.string "title"
    t.float "base_salary"
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tables", force: :cascade do |t|
    t.boolean "status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "address"
    t.string "password"
    t.string "phone_number"
    t.string "gender", default: "male"
    t.date "birth_date"
    t.integer "permission"
    t.string "activation_digest"
    t.datetime "activated_at"
    t.boolean "activated"
    t.string "reset_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
