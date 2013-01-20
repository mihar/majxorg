class Tweet < ActiveRecord::Base
  validates :tweet_id, :presence => true, :uniqueness => true
  validates :tweet, :presence => true
  
  scope :recent, order("tweeted_at DESC").limit(7)
  
  def self.fetch
    Twitter.configure do |config|
      config.consumer_key = "WBxs9yYMH5jwqYuyhJzXcQ"
      config.consumer_secret = "hgxHihgNrPcCs5s9Nq9PtCn09tAZqZd0N2RbrH2tsM"
      config.oauth_token = "14216454-qd8D3xTmycgeXIL8zSWTnpOPtRAELBc2PStFfXZvp"
      config.oauth_token_secret = "p8fcRr8LYWqcROhBLwmLiNRy79dJNldDeXk6jGjlg"
    end
    
    if tweets = Twitter.user_timeline(SERVICES['twitter']['username'])
      tweets.each do |tweet|
        new_tweet = self.new
        new_tweet.tweet = tweet.text
        new_tweet.tweet_id = tweet.id
        new_tweet.tweeted_at = tweet.created_at
        new_tweet.save
      end
    end
  end
end
