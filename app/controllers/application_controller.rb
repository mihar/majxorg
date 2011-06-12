class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_visitor_location, :current_visitor_distance, :current_location
  
  def current_visitor_location
    @current_visitor_location ||= Geolocation.new request.remote_ip
  end
  
  def current_visitor_distance
    @current_visitor_distance ||= if current_visitor_location
      current_location.distance_to current_visitor_location.to_a, :units => ["United States", "Canada", "United Kingdom"].include?(current_visitor_location.country) ? :miles : :kms
    else
      100
    end
  end
  
  def current_location
    @current_location ||= Location.last
  end
end
