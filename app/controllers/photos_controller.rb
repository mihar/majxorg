class PhotosController < ApplicationController
  def index
    @photos = Photo.order('flickr_id DESC').limit(100)
    cache_output 86400
  end
end
