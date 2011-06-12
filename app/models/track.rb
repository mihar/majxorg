class Track < ActiveRecord::Base
  validates :time_code, :presence => true, :uniqueness => true
  validates :played_at, :presence => true, :uniqueness => true
  validates :title, :presence => true
  
  scope :recent, order("played_at DESC").limit(10)
  
  def self.fetch
    if user = Scrobbler::User.new('majx')
      if tracks = user.recent_tracks
        tracks.each do |track|
          new_track = self.new
          new_track.title = track.name
          new_track.artist = track.artist
          new_track.album = track.album
          new_track.url = track.url
          new_track.played_at = track.date
          new_track.time_code = track.date_uts
          new_track.save
        end
      end
    end
  end
end
