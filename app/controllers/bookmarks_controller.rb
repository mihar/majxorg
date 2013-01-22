class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.order("posted_at DESC").limit(100)
    cache_output 86400
  end
end
