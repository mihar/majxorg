desc "This task is called by the Heroku scheduler add-on"
task :fetch_tweets => :environment do
  puts "Fetching Tweets..."
  Tweet.fetch
  puts "done."
end

task :fetch_location => :environment do
  puts "Fetching location..."
  Location.fetch
  puts "done."
end

task :fetch_tracks => :environment do
  puts "Fetching tracks..."
  Track.fetch
  puts "done."
end

task :fetch_posts => :environment do
  puts "Fetching posts..."
  Post.fetch
  puts "done."
end

task :fetch_bookmarks => :environment do
  puts "Fetching bookmarks..."
  Bookmark.fetch
  puts "done."
end

task :fetch_location => :environment do
  puts "Fetching location..."
  Location.fetch
  puts "done."
end