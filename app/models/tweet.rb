class Tweet < ActiveRecord::Base
  validates :tweet_id, :presence => true, :uniqueness => true
  validates :tweet, :presence => true
  
  scope :recent, order("tweeted_at DESC").limit(7)
  
  def self.fetch
    if tweets = Twitter.user_timeline("mihar")
      tweets.each do |tweet|
        new_tweet = self.new
        new_tweet.tweet = tweet.text
        new_tweet.tweet_id = tweet.id_str
        new_tweet.tweeted_at = tweet.created_at
        new_tweet.save
      end
    end
  end
end
