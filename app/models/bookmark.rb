class Bookmark < ActiveRecord::Base
  validates :delicious_id, :presence => true, :uniqueness => true
  scope :recent, order("posted_at DESC").limit(10)
    
  def self.fetch(count = 15)
    if request = HTTParty.get("http://feeds.delicious.com/v2/rss/rasmajx?count=#{count}")
      response = Crack::XML.parse request.parsed_response
      if response["rss"] and response["rss"]["channel"] and response["rss"]["channel"]["item"] and (response["rss"]["channel"]["item"].class == Array) and response["rss"]["channel"]["item"].any?
        items = response["rss"]["channel"]["item"]
        items.each do |bookmark|
          new_bookmark = Bookmark.new
          new_bookmark.title = bookmark["title"]
          new_bookmark.description = bookmark["description"]
          new_bookmark.url = bookmark["link"]
          new_bookmark.tags = (bookmark["category"].class == Array) ? bookmark["category"].join(", ") : bookmark["category"]
          new_bookmark.delicious_id = Bookmark.parse_id(bookmark["comments"])
          new_bookmark.posted_at = bookmark["pubDate"].to_time if bookmark["pubDate"]
          
          new_bookmark.save
        end
      end
    end
  end
  
  def self.parse_id(comments_url)
    comments_url.split("/").last
  end
end
