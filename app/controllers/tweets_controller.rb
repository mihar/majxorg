class TweetsController < ApplicationController
  def index
    @tweets = Tweet.order("tweeted_at DESC").limit(100)
  end
end
