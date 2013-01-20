class TracksController < ApplicationController
  def index
    @tracks = Track.order("played_at DESC").limit(100)
  end
end
