class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.string :title
      t.text :description
      t.string :flickr_url
      t.string :url
      t.string :url_small
      t.string :url_square
      t.string :flickr_id

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
