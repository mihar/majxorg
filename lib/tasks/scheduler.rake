desc "Fetch new tweets"
task :fetch_tweets => :environment do
  puts "Fetching Tweets..."
  Tweet.fetch
  puts "done."
end

desc "Fetch new location"
task :fetch_location => :environment do
  puts "Fetching location..."
  Location.fetch
  puts "done."
end

desc "Fetch new tracks"
task :fetch_tracks => :environment do
  puts "Fetching tracks..."
  Track.fetch
  puts "done."
end

desc "Fetch new posts"
task :fetch_posts => :environment do
  puts "Fetching posts..."
  Post.fetch
  puts "done."
end

desc "Fetch new bookmarks"
task :fetch_bookmarks => :environment do
  puts "Fetching bookmarks..."
  Bookmark.fetch
  puts "done."
end

desc "Fetch new photos"
task :fetch_photos => :environment do
  puts "Fetching photos..."
  Photo.fetch
  puts "done."
end