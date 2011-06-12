class Resource
  def self.fetch_all
    Bookmark.fetch
    Photo.fetch
    Post.fetch
    Track.fetch
    Tweet.fetch
    Location.fetch
  end
end