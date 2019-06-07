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

ActiveRecord::Schema.define(version: 2019_06_07_064833) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collect_tweet_ways", force: :cascade do |t|
    t.string "name"
    t.string "parameter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "parameter"], name: "index_collect_tweet_ways_on_name_and_parameter", unique: true
  end

  create_table "deleted_target_tweets", force: :cascade do |t|
    t.integer "collect_tweet_way_id"
    t.integer "target_user_id"
    t.bigint "tweet_id"
    t.string "text"
    t.datetime "tweeted_at"
    t.string "media_url_https_01"
    t.string "media_url_https_02"
    t.string "media_url_https_03"
    t.string "media_url_https_04"
    t.string "in_tweet_url"
    t.string "lang"
    t.boolean "is_retweet"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["text"], name: "index_deleted_target_tweets_on_text"
    t.index ["tweet_id"], name: "index_deleted_target_tweets_on_tweet_id", unique: true
  end

  create_table "raw_tweets", force: :cascade do |t|
    t.integer "tweet_id"
    t.text "target_tweet_object"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tweet_id"], name: "index_raw_tweets_on_tweet_id", unique: true
  end

  create_table "target_tweets", force: :cascade do |t|
    t.integer "collect_tweet_way_id"
    t.integer "target_user_id"
    t.bigint "tweet_id"
    t.string "text"
    t.datetime "tweeted_at"
    t.string "media_url_https_01"
    t.string "media_url_https_02"
    t.string "media_url_https_03"
    t.string "media_url_https_04"
    t.string "in_tweet_url"
    t.string "lang"
    t.boolean "is_retweet"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["text"], name: "index_target_tweets_on_text"
    t.index ["tweet_id"], name: "index_target_tweets_on_tweet_id", unique: true
  end

  create_table "target_users", force: :cascade do |t|
    t.bigint "twitter_user_id"
    t.string "name"
    t.string "screen_name"
    t.string "profile_image_url_https"
    t.string "lang"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["screen_name"], name: "index_target_users_on_screen_name"
    t.index ["twitter_user_id"], name: "index_target_users_on_twitter_user_id", unique: true
  end

end
