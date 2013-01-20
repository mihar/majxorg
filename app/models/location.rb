class Location < ActiveRecord::Base
  validates :located_at, :presence => true, :uniqueness => true
  validates :lat, :presence => true
  validates :lng, :presence => true

  acts_as_mappable

  default_scope order(:located_at)
  scope :recent, limit(5)

  def self.fetch
    loc = HTTParty.get "http://www.google.com/latitude/apps/badge/api?user=#{SERVICES['latitude']['user_id']}&type=json"
    
    if loc and loc["features"] and location = loc["features"][0]
      new_location = self.new
      # Fetch lat lng
      if location["geometry"] and coords = location["geometry"]["coordinates"]
        new_location.lng, new_location.lat = coords[0], coords[1]
      end
      # Fetch time and reverse
      if properties = location["properties"] 
        new_location.located_at = Time.at properties["timeStamp"] if properties["timeStamp"]
        new_location.reverse = properties["reverseGeocode"] if properties["reverseGeocode"]
      end
      new_location.save
    end
  end
  
  def static_map
    map_url = "http://maps.google.com/maps/api/staticmap?"
    map_url += "zoom=12&markers=size:mid|label:M|"
    map_url += lat.to_s
    map_url += ","
    map_url += lng.to_s
    map_url += "&size=240x240&sensor=false"
  end
  
  def to_s
    reverse
  end
end