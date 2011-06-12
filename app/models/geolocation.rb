require 'uri'

class Geolocation
  attr_accessor :country, :state, :street, :city, :lat, :lng
  
  def initialize(ip)
    if ip == "127.0.0.1" or ip =~ /10.0.0./
      self.country, self.city, self.state = "United States", "Palo Alto", "CA"
      self.lat, self.lng = 46.235179, 15.277648
    end
  
    g = GeoIP.new File.join(Rails.root, "db", "GeoLiteCity.dat")
    geodata = g.city(ip)
    return unless geodata
    self.country = geodata[4]
    self.state = geodata[6]
    self.city = geodata[7]
    self.lat = geodata[9]
    self.lng = geodata[10]
  end
  
  def data?
    lat and lng
  end
  
  def to_a
    [lat, lng] if lat and lng
  end
  
  def to_s
    if street and city
      "#{street}, #{city}"
    elsif city and state and state.to_i == 0
      "#{city}, #{state}"
    elsif city and country
      "#{city}, #{country}"
    elsif country
      country
    end
  end
end