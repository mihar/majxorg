class PagesController < ApplicationController
  def index
    @posts = Post.recent
    @tracks = Track.recent
    @tweets = Tweet.recent
    @photos = Photo.recent
    @bookmarks = Bookmark.recent
  end

end
