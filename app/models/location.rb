class Location < ActiveRecord::Base
  validates :located_at, :presence => true, :uniqueness => true
  validates :lat, :presence => true
  validates :lng, :presence => true

  acts_as_mappable :default_units => :kms, 
                    :default_formula => :sphere, 
                    :lat_column_name => :lat,
                    :lng_column_name => :lng

  default_scope order("located_at DESC")
  scope :recent, limit(5)

  def self.fetch
    loc = HTTParty.get "http://www.google.com/latitude/apps/badge/api?user=-846891962410257619&type=json"
    
    if loc and loc["features"] and location = loc["features"][0]
      new_location = self.new
      # Fetch lat lng
      if location["geometry"] and coords = location["geometry"]["coordinates"]
        new_location.lat, new_location.lng = coords[0], coords[1]
      end
      # Fetch time and reverse
      if properties = location["properties"] 
        new_location.located_at = Time.at properties["timeStamp"] if properties["timeStamp"]
        new_location.reverse = properties["reverseGeocode"] if properties["reverseGeocode"]
      end
      new_location.save
    end
  end
  
  def to_s
    reverse
  end
end