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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110612084023) do

  create_table "bookmarks", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "url"
    t.string   "tags"
    t.datetime "posted_at"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "bookmarks", ["url"], :name => "index_bookmarks_on_url", :unique => true

  create_table "locations", :force => true do |t|
    t.float    "lat"
    t.float    "lng"
    t.string   "reverse"
    t.datetime "located_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "locations", ["located_at"], :name => "index_locations_on_located_at", :unique => true

  create_table "photos", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "flickr_url"
    t.string   "url"
    t.string   "url_small"
    t.string   "url_square"
    t.string   "flickr_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "photos", ["flickr_id"], :name => "index_photos_on_flickr_id", :unique => true

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.text     "body_html"
    t.string   "url"
    t.string   "permalink"
    t.string   "remote_id"
    t.datetime "posted_at"
    t.string   "source"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "posts", ["remote_id"], :name => "index_posts_on_remote_id", :unique => true

  create_table "tracks", :force => true do |t|
    t.string   "title"
    t.string   "artist"
    t.string   "album"
    t.string   "url"
    t.string   "time_code"
    t.datetime "played_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tracks", ["time_code"], :name => "index_tracks_on_time_code", :unique => true

  create_table "tweets", :force => true do |t|
    t.string   "tweet"
    t.string   "tweet_id"
    t.datetime "tweeted_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tweets", ["tweet_id"], :name => "index_tweets_on_tweet_id", :unique => true

end
