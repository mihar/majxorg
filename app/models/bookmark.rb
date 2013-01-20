class Bookmark < ActiveRecord::Base
  validates :url, :presence => true, :uniqueness => true
  scope :recent, order("posted_at DESC").limit(10)
    
  def self.fetch(count = 15)
    if request = HTTParty.get("http://feeds.pinboard.in/json/u:mihar/?count=#{count}")
      if request.parsed_response and request.parsed_response.any?
        request.parsed_response.each do |bookmark|
          new_bookmark = Bookmark.new
          new_bookmark.title = bookmark["d"]
          new_bookmark.description = bookmark["n"]
          new_bookmark.url = bookmark["u"]
          if (bookmark["t"].class == Array) and bookmark["t"].any? and (bookmark["t"].first != '')
            new_bookmark.tags = bookmark["t"].join(", ")
          end
          new_bookmark.posted_at = bookmark["dt"].to_time if bookmark["dt"]
          
          new_bookmark.save
        end
      end
    end
  end
  
  def self.parse_id(comments_url)
    comments_url.split("/").last
  end
end
