class PagesController < ApplicationController
  def index
    @posts = Post.recent
    @tracks = Track.recent
    @tweets = Tweet.recent
    @photos = Photo.recent
    @bookmarks = Bookmark.recent
    cache_output 3600
  end

  def location
    respond_to do |wants|
      wants.js
    end
  end
end
