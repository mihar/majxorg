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
    t.string   "delicious_id"
    t.datetime "posted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.decimal  "lat"
    t.decimal  "lng"
    t.string   "reverse"
    t.datetime "located_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "flickr_url"
    t.string   "url"
    t.string   "url_small"
    t.string   "url_square"
    t.string   "flickr_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.text     "body_html"
    t.string   "url"
    t.string   "permalink"
    t.string   "remote_id"
    t.datetime "posted_at"
    t.string   "source"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tracks", :force => true do |t|
    t.string   "title"
    t.string   "artist"
    t.string   "album"
    t.string   "url"
    t.string   "time_code"
    t.datetime "played_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tweets", :force => true do |t|
    t.string   "tweet"
    t.string   "tweet_id"
    t.datetime "tweeted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
