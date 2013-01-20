require 'digest/md5'

class Track < ActiveRecord::Base
  validates :time_code, :presence => true, :uniqueness => true
  validates :title, :presence => true
  
  scope :recent, order("played_at DESC").limit(15)
  
  def self.fetch
    if user = Scrobbler::User.new(SERVICES['lastfm']['username'])
      if tracks = user.recent_tracks
        tracks.each do |track|
          new_track = self.new
          new_track.title = track.name
          new_track.artist = track.artist
          new_track.album = track.album
          new_track.url = track.url
          new_track.played_at = track.date + 2.hours
          new_track.time_code = Digest::MD5.hexdigest("#{track.url}#{track.date.hour}")
          new_track.save
        end
      end
    end
  end
end
