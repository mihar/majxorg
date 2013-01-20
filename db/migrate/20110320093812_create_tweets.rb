class CreateTweets < ActiveRecord::Migration
  def self.up
    create_table :tweets do |t|
      t.string :tweet
      t.string :tweet_id
      t.datetime :tweeted_at

      t.timestamps
    end

    add_index :tweets, :tweet_id, :unique => true
  end

  def self.down
    drop_table :tweets
  end
end
