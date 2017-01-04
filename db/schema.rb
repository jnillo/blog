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

ActiveRecord::Schema.define(version: 20170103130040) do

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "slug"
    t.index ["name"], name: "index_categories_on_name", using: :btree
    t.index ["slug"], name: "index_categories_on_slug", using: :btree
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "user"
    t.text     "content",    limit: 65535
    t.integer  "status",                   default: 0
    t.integer  "post_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["post_id", "status"], name: "index_comments_on_post_id_and_status", using: :btree
    t.index ["post_id"], name: "index_comments_on_post_id", using: :btree
    t.index ["status"], name: "index_comments_on_status", using: :btree
    t.index ["user"], name: "index_comments_on_user", using: :btree
  end

  create_table "contacts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "subject"
    t.text     "content",    limit: 65535
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["email"], name: "index_contacts_on_email", using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "posts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "title",         limit: 65535
    t.text     "resume",        limit: 65535
    t.text     "content",       limit: 65535
    t.string   "author"
    t.date     "published"
    t.string   "uri"
    t.string   "external_link"
    t.integer  "category_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "slug"
    t.string   "tags"
    t.string   "image"
    t.integer  "resource_id"
    t.integer  "likes",                       default: 0
    t.index ["category_id"], name: "index_posts_on_category_id", using: :btree
    t.index ["slug"], name: "index_posts_on_slug", using: :btree
  end

  create_table "resources", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "description", limit: 65535
    t.string   "link"
    t.string   "image"
    t.integer  "downloads"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.boolean  "status",                    default: true
    t.string   "category"
    t.index ["category"], name: "index_resources_on_category", using: :btree
    t.index ["status", "category"], name: "index_resources_on_status_and_category", using: :btree
    t.index ["status"], name: "index_resources_on_status", using: :btree
  end

  create_table "seo_datas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "seo_description"
    t.string   "seo_title"
    t.string   "seo_image"
    t.string   "seo_tags"
    t.integer  "post_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["post_id"], name: "index_seo_datas_on_post_id", using: :btree
  end

end
