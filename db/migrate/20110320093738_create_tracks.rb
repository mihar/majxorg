class CreateTracks < ActiveRecord::Migration
  def self.up
    create_table :tracks do |t|
      t.string :title
      t.string :artist
      t.string :album
      t.string :url
      t.string :time_code
      t.datetime :played_at

      t.timestamps
    end

    add_index :tracks, :time_code, :unique => true
  end

  def self.down
    drop_table :tracks
  end
end
