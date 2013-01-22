class TweetsController < ApplicationController
  def index
    @tweets = Tweet.order("tweeted_at DESC").limit(100)
    cache_output 3600
  end
end
