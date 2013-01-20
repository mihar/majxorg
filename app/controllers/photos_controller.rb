class PhotosController < ApplicationController
  def index
    @photos = Photo.order('flickr_id DESC').limit(100)
  end
end
