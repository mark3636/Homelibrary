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

ActiveRecord::Schema.define(version: 20180413144044) do

  create_table "books", force: :cascade do |t|
    t.string "name", null: false
    t.integer "pub_year", null: false
    t.string "pic_author"
    t.string "translator"
    t.string "author", null: false
    t.text "comment"
    t.integer "publishing_house_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publishing_house_id"], name: "index_books_on_publishing_house_id"
  end

  create_table "books_genres", id: false, force: :cascade do |t|
    t.integer "book_id"
    t.integer "genre_id"
    t.index ["book_id"], name: "index_books_genres_on_book_id"
    t.index ["genre_id"], name: "index_books_genres_on_genre_id"
  end

  create_table "borrowings", force: :cascade do |t|
    t.integer "book_id"
    t.integer "friend_id"
    t.datetime "borrow_date", null: false
    t.boolean "is_lost"
    t.boolean "is_damaged"
    t.datetime "return_date"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id", "friend_id", "borrow_date"], name: "index_borrowings_on_book_id_and_friend_id_and_borrow_date", unique: true
    t.index ["book_id"], name: "index_borrowings_on_book_id"
    t.index ["friend_id"], name: "index_borrowings_on_friend_id"
  end

  create_table "friends", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "phone_number", null: false
    t.string "social_profile"
    t.string "email", null: false
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "name", null: false
    t.integer "parent_genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publishing_houses", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
