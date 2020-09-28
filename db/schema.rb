# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_28_101537) do

  create_table "customerreviews", force: :cascade do |t|
    t.string "customertype"
    t.string "customername"
    t.string "customeremail"
    t.integer "reviewrating"
    t.string "reviewbody"
    t.string "publish"
    t.integer "productid"
    t.integer "reviewid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customerreviewtags", force: :cascade do |t|
    t.integer "customerreview_id", null: false
    t.string "producttag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customerreview_id"], name: "index_customerreviewtags_on_customerreview_id"
  end

  create_table "productlists", force: :cascade do |t|
    t.string "title"
    t.string "body"
    t.string "option1"
    t.string "option2"
    t.string "option3"
    t.string "option1val"
    t.string "option2val"
    t.string "option3val"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "shops", force: :cascade do |t|
    t.string "shopify_domain", null: false
    t.string "shopify_token", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shopify_domain"], name: "index_shops_on_shopify_domain", unique: true
  end

  create_table "tagcreations", force: :cascade do |t|
    t.string "producttitle"
    t.string "productoption"
    t.string "productvalue"
    t.integer "producttagid"
    t.string "producttag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "productoption1"
    t.string "productvalue1"
    t.string "productoption2"
    t.string "productvalue2"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "shopify_user_id", null: false
    t.string "shopify_domain", null: false
    t.string "shopify_token", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shopify_user_id"], name: "index_users_on_shopify_user_id", unique: true
  end

  add_foreign_key "customerreviewtags", "customerreviews"
end
