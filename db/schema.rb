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

ActiveRecord::Schema[7.0].define(version: 2022_05_03_085449) do
  create_table "action_mailer_users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture"
  end

  create_table "addresses", force: :cascade do |t|
    t.string "myuser_address"
    t.integer "myuser_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["myuser_id"], name: "index_addresses_on_myuser_id"
  end

  create_table "api_comments", force: :cascade do |t|
    t.string "content"
    t.date "date_of_comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "article_id"
    t.index ["article_id"], name: "index_api_comments_on_article_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.string "body"
    t.date "release_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authors", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.date "dob"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authors_books", id: false, force: :cascade do |t|
    t.integer "author_id", null: false
    t.integer "book_id", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "author_id", null: false
    t.index ["author_id"], name: "index_books_on_author_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "myuser_id"
    t.index ["myuser_id"], name: "index_categories_on_myuser_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "myuser_id"
    t.integer "event_id"
    t.integer "likes"
    t.index ["event_id"], name: "index_comments_on_event_id"
    t.index ["myuser_id"], name: "index_comments_on_myuser_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.string "email"
    t.integer "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.integer "age"
    t.integer "no_of_order"
    t.boolean "full_time_available"
    t.float "salary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enrolled_users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "event_id"
    t.integer "myuser_id"
    t.index ["event_id"], name: "index_enrolled_users_on_event_id"
    t.index ["myuser_id"], name: "index_enrolled_users_on_myuser_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.date "event_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "myuser_id"
    t.integer "category_id"
    t.index ["category_id"], name: "index_events_on_category_id"
    t.index ["myuser_id"], name: "index_events_on_myuser_id"
  end

  create_table "faculties", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.integer "phone_num"
    t.string "email"
    t.date "DOB"
    t.string "designation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.text "image"
    t.string "imageable_type"
    t.integer "imageable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable"
  end

  create_table "myaddresses", force: :cascade do |t|
    t.string "house_name"
    t.string "street_name"
    t.string "road"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "myemployee_id"
    t.index ["myemployee_id"], name: "index_myaddresses_on_myemployee_id"
  end

  create_table "myemployees", force: :cascade do |t|
    t.string "employee_name"
    t.string "email"
    t.string "password"
    t.string "gender"
    t.string "hobbies"
    t.string "address"
    t.integer "mobile_number"
    t.date "birth_date"
    t.string "document"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "myproducts", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "price"
    t.integer "capacity"
    t.boolean "is_active"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "myusers", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "quantity"
    t.integer "status"
    t.integer "total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "customer_id"
    t.integer "myproduct_id"
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["myproduct_id"], name: "index_orders_on_myproduct_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.string "brand"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rcustomers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rendorders", force: :cascade do |t|
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rendproduct_id"
    t.index ["rendproduct_id"], name: "index_rendorders_on_rendproduct_id"
  end

  create_table "rendproducts", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "renduser_id"
    t.index ["renduser_id"], name: "index_rendproducts_on_renduser_id"
  end

  create_table "rendusers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_rendusers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_rendusers_on_reset_password_token", unique: true
  end

  create_table "rorders", force: :cascade do |t|
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rproduct_id"
    t.index ["rproduct_id"], name: "index_rorders_on_rproduct_id"
  end

  create_table "rproducts", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.date "DOB"
    t.string "department"
    t.boolean "terms_of_usage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "test_products", force: :cascade do |t|
    t.string "product_name"
    t.integer "price"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "renduser_id"
    t.index ["renduser_id"], name: "index_test_products_on_renduser_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "addresses", "myusers"
  add_foreign_key "rorders", "rproducts"
end
