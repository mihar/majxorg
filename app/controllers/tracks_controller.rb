class TracksController < ApplicationController
  def index
    @tracks = Track.order("played_at DESC").limit(100)
    cache_output 3600
  end
end
