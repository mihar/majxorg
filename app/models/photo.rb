class Photo < ActiveRecord::Base
  validates :flickr_id, :presence => true, :uniqueness => true
  scope :recent, order("flickr_id DESC").limit(12)
    
  def self.fetch
    FlickRaw.api_key = SERVICES['flickr']['api_key']
    FlickRaw.shared_secret = SERVICES['flickr']['shared_secret']
    auth = flickr.auth.checkToken :auth_token => "72157606052057860-f025e05a0859d0b8"
    if photos = flickr.people.getPhotos(:user_id => "12414112@N04")
      photos.each do |photo|
        new_photo = self.new
        new_photo.flickr_id = photo.id
        new_photo.title = photo.title
        new_photo.flickr_url = FlickRaw.url_photopage photo
        new_photo.url_small = FlickRaw.url_m photo
        new_photo.url_square = FlickRaw.url_s photo
        new_photo.url = FlickRaw.url_z photo
        
        new_photo.save
      end
    end    
  end
end
