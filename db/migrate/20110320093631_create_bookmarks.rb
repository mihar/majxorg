class CreateBookmarks < ActiveRecord::Migration
  def self.up
    create_table :bookmarks do |t|
      t.string :title
      t.text :description
      t.string :url
      t.string :tags
      t.datetime :posted_at

      t.timestamps
    end

    add_index :bookmarks, :url, :unique => true
  end

  def self.down
    drop_table :bookmarks
  end
end
