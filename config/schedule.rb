every 5.minutes do
  runner "Location.fetch"
  runner "Track.fetch"
  runner "Tweet.fetch"
end

every 15.minutes do
  runner "Photo.fetch"
end

every 30.minutes do
  runner "Bookmark.fetch"
end

every 2.hours do
  runner "Post.fetch"
end