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

ActiveRecord::Schema.define(version: 20140422193035) do

  create_table "comments", force: true do |t|
    t.string   "commenter"
    t.text     "body"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id"

  create_table "posts", force: true do |t|
    t.string   "name"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spud_admin_permissions", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.boolean  "access"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "scope"
  end

  create_table "spud_photo_albums", force: true do |t|
    t.string   "title"
    t.string   "url_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spud_photo_albums", ["url_name"], name: "idx_album_url_name"

  create_table "spud_photo_albums_photos", force: true do |t|
    t.integer "spud_photo_album_id"
    t.integer "spud_photo_id"
    t.integer "sort_order",          default: 0
  end

  add_index "spud_photo_albums_photos", ["spud_photo_album_id"], name: "idx_album_id"

  create_table "spud_photo_galleries", force: true do |t|
    t.string   "title"
    t.string   "url_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spud_photo_galleries", ["url_name"], name: "idx_gallery_url_name"

  create_table "spud_photo_galleries_albums", force: true do |t|
    t.integer "spud_photo_gallery_id"
    t.integer "spud_photo_album_id"
    t.integer "sort_order",            default: 0
  end

  add_index "spud_photo_galleries_albums", ["spud_photo_gallery_id"], name: "idx_gallery_id"

  create_table "spud_photos", force: true do |t|
    t.string   "title"
    t.string   "caption"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spud_user_settings", force: true do |t|
    t.integer  "spud_user_id"
    t.string   "key"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spud_users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "super_admin"
    t.string   "login",                           null: false
    t.string   "email",                           null: false
    t.string   "crypted_password",                null: false
    t.string   "password_salt",                   null: false
    t.string   "persistence_token",               null: false
    t.string   "single_access_token",             null: false
    t.string   "perishable_token",                null: false
    t.integer  "login_count",         default: 0, null: false
    t.integer  "failed_login_count",  default: 0, null: false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "time_zone"
  end

  add_index "spud_users", ["email"], name: "index_spud_users_on_email"
  add_index "spud_users", ["login"], name: "index_spud_users_on_login"

  create_table "todoos", force: true do |t|
    t.string   "name"
    t.boolean  "done"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "todos", force: true do |t|
    t.string   "name"
    t.boolean  "done"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
